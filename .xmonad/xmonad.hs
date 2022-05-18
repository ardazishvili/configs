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

-- For polybar
import qualified DBus as D
import qualified DBus.Client as D
import qualified Codec.Binary.UTF8.String as UTF8

main = do 
  dbus <- D.connectSession
  -- Request access to the DBus name
  D.requestName dbus (D.busName_ "org.xmonad.Log") [D.nameAllowReplacement, D.nameReplaceExisting, D.nameDoNotQueue]
  xmonad $ def {
      terminal = "alacritty"
      , layoutHook = baseLayout
      , manageHook = manageDocks
      , logHook = dynamicLogWithPP (myLogHook dbus)
      , startupHook = spawn "compton --config ~/.xmonad/compton.conf" <+> spawn "setxkbmap -layout us,ru -option 'grp:lctrl_lshift_toggle'"
    } `additionalKeys` myKeys

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
myStartupHook = do
    spawn "compton --config ~/.xmonad/compton.conf"

myLogHook :: D.Client -> PP
myLogHook dbus = def
    { ppOutput = dbusOutput dbus
    , ppCurrent = wrap ("%{B" ++ bg2 ++ "} ") " %{B-}"
    , ppVisible = wrap ("%{B" ++ bg1 ++ "} ") " %{B-}"
    , ppUrgent = wrap ("%{F" ++ red ++ "} ") " %{F-}"
    , ppHidden = wrap " " " "
    , ppWsSep = ""
    , ppSep = " : "
    , ppTitle = shorten 40
    }

dbusOutput :: D.Client -> String -> IO ()
dbusOutput dbus str = do
    let signal = (D.signal objectPath interfaceName memberName) {
            D.signalBody = [D.toVariant $ UTF8.decodeString str]
        }
    D.emit dbus signal
  where
    objectPath = D.objectPath_ "/org/xmonad/Log"
    interfaceName = D.interfaceName_ "org.xmonad.Log"
    memberName = D.memberName_ "Update"


baseLayout = noBorders $ avoidStruts $ full ||| tiled 
  where
    tiled =  spacingRaw False (Border 0 35 10 0) True (Border 0 10 10 0) True $ Tall 1 (3/100) (1/2) 
    full =  spacingRaw False (Border 0 45 10 0) True (Border 0 0 0 0) True $ Full

fg        = "#ebdbb2"
bg        = "#282828"
gray      = "#a89984"
bg1       = "#3c3836"
bg2       = "#504945"
bg3       = "#665c54"
bg4       = "#7c6f64"

green     = "#b8bb26"
darkgreen = "#98971a"
red       = "#fb4934"
darkred   = "#cc241d"
yellow    = "#fabd2f"
blue      = "#83a598"
purple    = "#d3869b"
aqua      = "#8ec07c"
