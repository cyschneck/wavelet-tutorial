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

  print (w@power)
                         ; create coordinate arrays for plot
  power            = onedtond( w@power, (/jtot,N/) )
  power!0          = "period"                        ; Y axis
  power&period     = w@period
  power!1          = "time"                          ; X axis
  power&time       = x&time
  power@long_name  = "Power Spectrum"
  power@units      = "C^2"

                         ; compute significance ( >= 1 is significant)
  SIG  = power           ; transfer metadata
  SIG  = power/conform (power,w@signif,0)

  wks = gsn_open_wks("png","ncl_power_output")
                         ; PLOT (only up to periods of 64)
                         ; power
  res                     = True
  res@cnFillOn            = True
  res@trYReverse          = True
  plot = gsn_csm_contour(wks,power({0:64},:),res)  

                         ; significance
  RES = True
  RES@cnLevelSelectionMode = "ManualLevels"     ; set manual contour levels
  RES@cnMinLevelValF       = 1.0                ; set min contour level
  RES@cnMaxLevelValF       = 4.0                ; set max contour level
  RES@cnLevelSpacingF      = 3.0                ; set contour spacing
  RES@trYReverse           = True
  pSIG = gsn_contour(wks,SIG({0:64},:),RES) 

end
