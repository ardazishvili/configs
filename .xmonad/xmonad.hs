import XMonad
import XMonad.Layout.Spacing
import XMonad.Layout.NoBorders
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.DynamicLog
import Graphics.X11.ExtraTypes.XF86
import XMonad.Util.EZConfig
import XMonad.Layout.DwmStyle
-- import XMonad.Hooks.FadeInactive
import XMonad.Hooks.FadeWindows

main = xmonad =<< statusBar myBar myPP toggleStrutsKey myConfig

myBar = "xmobar"
myPP = xmobarPP { ppCurrent = xmobarColor "#429942" "" . wrap "<" ">" }
toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)
modm = mod4Mask
myKeys =
  [
    ((mod1Mask,                xK_p ), spawn "rofi -show run")
    ,((0, xF86XK_AudioLowerVolume  ), spawn "amixer set Master 2-")
    ,((0, xF86XK_AudioRaiseVolume  ), spawn "amixer set Master 2+")
    ,((0, xF86XK_AudioMute         ), spawn "amixer set Master toggle")
    ,((0, xF86XK_MonBrightnessUp   ), spawn "xbacklight + 5")
    ,((0, xF86XK_MonBrightnessDown ), spawn "xbacklight - 5")
  ]

mySDConfig = def { 
                   inactiveBorderColor = "green"
                   , inactiveTextColor  = "green"
                   , activeBorderColor = "blue"
                   , activeTextColor  = "blue"
                 }

myStartupHook :: X ()
myStartupHook = spawn "compton --config ~/.xmonad/compton.conf"

myConfig = def {
      terminal = "alacritty"
      , layoutHook = baseLayout
      , manageHook = manageDocks
      , startupHook = spawn "compton --config ~/.xmonad/compton.conf" <+> spawn "setxkbmap -layout us,ru -option 'grp:lctrl_lshift_toggle'" 
    } `additionalKeys` myKeys

baseLayout = noBorders $ avoidStruts $ Full ||| tiled 
  where
    tiled =  spacingRaw False (Border 10 0 10 0) True (Border 0 10 0 10) True $ Tall 1 (3/100) (1/2) 

