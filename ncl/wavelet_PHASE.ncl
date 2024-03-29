load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl" 
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl" 

begin
;  f      = addfile ("sst_nino3.nc", "r")
;  x      = f->SST
;  N      = dimsizes(x)   ; number of elements [here 504]

  x = asciiread("sst_nino3.dat",-1,"float")
  x!0 = "time"
  N = dimsizes(x)

  timeo = fspan(1871.25,1996.,N)
  x&time = timeo
  ;print (x)

  mother = 0             ; Morlet wavelet
  param  = 6.0           ; common for Morlet
  dt     = 0.25          
  s0     = 0.25
  dj     = 0.25          ; 4 sub-octaves per octave
  jtot   = 44            ; =subScale*11
  npad   = N             ; pad with extra zeros, most commonly, npad = N [i.e. no padding]
  nadof  = new( 2,float) ; ignored

  noise  = 1             ; test vs red noise
  siglvl = 0.05
  isigtest= 0           

  w      = wavelet (x,mother,dt,param,s0,dj,jtot,npad, \
                     noise,isigtest,siglvl,nadof)

  print (w@phase)
                         ; create coordinate arrays for plot
  phase            = onedtond( w@phase, (/jtot,N/) )
  phase!0          = "period"                        ; Y axis
  phase&period     = w@period
  phase!1          = "time"                          ; X axis
  phase&time       = x&time
  phase@long_name  = "Phase Spectrum"
  phase@units      = "Angle"

                         ; compute significance ( >= 1 is significant)
  SIG  = phase           ; transfer metadata
  SIG  = phase/conform (phase,w@signif,0)

  wks = gsn_open_wks("png","ncl_phase_output")
                         ; PLOT (only up to periods of 64)
                         ; phase
  res                     = True
  res@cnFillOn            = True
  res@trYReverse          = True
  plot = gsn_csm_contour(wks,phase({0:64},:),res)  

                         ; significance
  RES = True
  RES@cnLevelSelectionMode = "ManualLevels"     ; set manual contour levels
  RES@cnMinLevelValF       = 1.0                ; set min contour level
  RES@cnMaxLevelValF       = 4.0                ; set max contour level
  RES@cnLevelSpacingF      = 3.0                ; set contour spacing
  RES@trYReverse           = True
  pSIG = gsn_contour(wks,SIG({0:64},:),RES) 

end
