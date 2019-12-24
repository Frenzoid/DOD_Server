# -- DISCONTINUED --

VERSION 0.7.3.2 Hotfix

```
Requires Server Update

Fixed Stuff
--Fixed players disappearing after eating a corpse
--Toned down bite sounds until Simon tweaks them
--Temporary fix for server filters
--Found missing species sounds

BROKEN STUFF
--Server browser is only showing 1 server at a time in the listing, workaround is to use the server name filter to find the server you want until I fix it tomorrow. I'm tired.
```

VERSION 0.7.3.1 The "Server TLC" Update

```
Requires Server Update

NEW STUFF
--Added Server Persistence, player progress will now save on logout. All player progress is now stored in a local database on the server. Players who logout near non-groupies will remain in the game for 60s, players who logout in a safe area (no non-groupies) will logout and save immediately
--Added Server Filters, you can now filter by server name, max results, official only, hide empty, hide full, sort by players, and sort by ping.
--Added admin command /save to force a world save of all player data before restarting server.
--Enabled Auto save interval in server config. iAutoSaveInterval=300 by default. (seconds between server autosaves) (refer to #resources server .zip download for config instructions)
--Temporarily added Snow and a Christmas redacted in the redacted for the Holidays, but you have to find it!
--New dragon bite sounds added
--New dragon species sounds added
--New pookie sounds added
--All dragons now have 100% Gremlin Resistance, Gremlins, however, apply slow during threat, broadcast, whine, and cry vocalizations
--Added /die command due to popular vote

CHANGED STUFF
--Official servers are now Red in server list
--/stuck command now moves you farther away to better help people get unstuck
--Pookie is no longer an underground vacuum
--Pookie can now only be played once per session

FIXED STUFF
--Optimization pass on corpses, they shouldn't cause so much lag on the server
--Admins should now be able to override server capacity
--Session Banning players should now keep players from entering your server during session
--Config banning players should now keep players from entering server
--Whitelisting should now work properly
--Fixed infi fire breath on Fire Wyvern if killed when breathing fire

BROKEN STUFF
--Do not carry hatchlings through portals
--Server Filters may not all work and still need tested 
Merry Christmas!
```

VERSION 0.7.2.6 

```
Requires server update

NEW STUFF
--Server Admins can now redacted any time they want
--Players can now redacted but only one per server, lots of food when dead and must eat constantly

CHANGED STUFF
--Character now stays in the game for 5 minutes on disconnect or logout to give player time to reconnect (temporary until Server persistence is live)
--Some Sound FX updated
--Server optmization improvements to reduce lag
--Adjusted biting hitboxes for all dragons
--Growth times temporarily reduced until server persistence is out
--Doubled food value for corpses
--Clicking off chat now exits chat automatically
--Escape menu can now be used when chat box active

FIXED STUFF
--Fixed bug where players were sometimes unable to hatch
--Fixed infinite inferno sound loop on Fire Wyvern
--Fixed the infamous broken chat bug
--Fixed annoying chat text caret scrolling to end when editing text bug
--Fixed breathing fire infiniloop after death
--Fixed fire breathing dragons not falling over after death
--Fixed corpses still growing after death which was creepy
--Fixed a bug where pressing enter before hatching locked your inputs

BROKEN STUFF
--Server persistence
```

VERSION 0.7.2.2 Hotfix

```
Requires server update

FIXED STUFF
--Fixed a client crash
--Small lag fix
--New hatch prompt tooltip should no longer be permanent if hatching at exactly 10 seconds
--Fix for hosted servers not being able to update through web app automatically

BROKEN STUFF
--Server persistence does not work currently
--Hatching sometimes doesn't work
--Chat box sometimes prevents tab switching or scrolling
```

VERSION 0.7.2.1 is now LIVE on Steam

```
Requires a Server Update

NEW STUFF
--Added Hatch Key Prompt after 10 seconds

CHANGED STUFF
--Added static corpses throughout the world players can eat, players will have to explore to find them (thermal vision)
--Changed chat name colors (work in progress)
--Lowered time needed to hold E to eat/drink to 2 seconds
--Increased food/water detection range so its easier to eat/drink
--Extended thermal vision range to 100m

FIXED STUFF
--Fixed a thermal vision bug
--Fixed an eating/drinking bug

BROKEN STUFF
--Server persistence does not work currently
--Hatching sometimes doesn't work
--Chat box sometimes prevents tab switching or scrolling
```

VERSION 0.7.2.0 Update Now Live

```
*Server Hosts will want to update to the latest version for EA release.

NEW STUFF
--Added Day of Dragons Theme to Main Menu
--Logging out now checks for nearby hostiles before despawning your character, if a non-grouped player is nearby your character will remain in the world for 60 seconds. If no non-grouped players are nearby, you will logout immediately.
--Added sound fx for plasma shot
--[EventPlayerDeath] added to server log with timestamp showing both name and steam id of player who died and the name/steam ID of who killed them
--Partially added server persistence, still work to do, the rest will come in a patch.

CHANGED STUFF
--Sound Updates
--UI Updates
--Dragon Growth Times set back to "normal"
--Fire dragon/wyvern can now breath fire while running
--Plasma can now be fired when running
--Removed all feeding troughs from game

FIXED STUFF
--Loading screens should now resize correctly to different DPI scales
--Fixed Error message screen
--Fixed Calls always playing 1 call for 3rd parties
--Fixed eggs sometimes not hatching bug
--Fixed Adults can now attack after dropping corpses
--Fixed Babies are no longer stuck in the mouth of a dragon who logs out
--Misc fixes I forgot to jot down (thank you Dragon Testers)
--Fixed dropped corpses can never be picked up again
--Fixed server multithread lockup bug 
--Fixed admin nametags

BROKEN STUFF
--Chat box may become unusable after using fire attacks
--Server persistence is disabled for now
```


VERSION 0.7.1.3

```
NEW STUFF
--Added admin /showtags & /hidetags commands to show/hide player PIDs in game over their heads
--Fire wyvern Inferno sound added

CHANGED STUFF
--Options Menu can now be accessed from Spawn Screen

FIXED STUFF
--Controllers can now be used for emotes
--Bodies no longer stay in the air when killed in the air
--Reticle should now always work
--Babies being carried can no longer be picked up
--Fixed the infamous group bug!

BROKEN STUFF
--Scrolling in chat box may crash your client for unknown reason

TEST STUFF
--Test the group system and make sure its fixed (thank you to everyone who helped us track the bug down)
--Test the other bug fixes to make sure they're fixed

Server persistence coming 0.7.2.0
```

---

VERSION 0.7.1.2 - Hotfix

```
NEW STUFF
--Keybinds for calls added

CHANGED STUFF
--Calls can no longer be spammed
--Adjusted call sound volumes

FIXED STUFF
--Plasma blast is now fixed - for real this time

BROKEN STUFF
--Groups may break for unknown reason
--Scrolling in chat box may crash your client for unknown reason

TEST STUFF
--Test combat for bugs/balancing issues
--Offering a White Dragon skin bounty to anyone who can accurately reproduce the Group break bug and tell me exactly what is causing it. If I am able to reproduce it with your instructions, you'll get a White Dragon Skin DLC

Server Persistence coming 0.7.2.0
```

---

VERSION 0.7.1.1

```
NEW STUFF
--Dead hatchlings can now be picked up and carried to your nest (for food)
--Added Fire Sweep attack for Fire dragon/wyvern
--Added Friendly, Threaten, Roar, and Surrender (Generic emotes/using same sounds, WIP)

CHANGED STUFF
--Lens flare disabled, no more blinding fires!
--Adjusted bite hitboxes for all dragons
--Adjusted fire hitboxes for all dragons
--Fire Wyvern Inferno can no longer be activated when swimming and swimming will deactivate the ability
--Can no longer attack while carrying a hatchling
--Increased eat/drink detection radius
--Rebalanced stats for all dragons (still a WIP)
--Fire Wyvern can no longer activate inferno until it can produce bile
--Inferno FX updated
--Spawn locations moved
--Changed plasma dragon drink animation

FIXED STUFF
--Attempted fix for corpse lag on server
--Plasma shot no longer collides on self
--Fire Wyvern can now breath fire while flying
--Dying now deactivates special abilities
--Fixed plasma invisibility grey textureless bug when laying down while invisible
--Fixed attack animations not triggering on plasma when invisible
--Fixed fire dragon bobbing when swimming
--Fixed wyvern horns not glowing in thermal vision

OTHER STUFF
--Misc. Server optimizations
--Game mechanic tweaks

BROKEN STUFF
--Groups may break for unknown reason
--Scrolling in chat box may crash your client for unknown reason

TEST STUFF
--Test combat for bugs/balancing issues
--Offering a White Dragon skin bounty to anyone who can accurately reproduce the Group break bug and tell me exactly what is causing it. If I am able to reproduce it with your instructions, you'll get a White Dragon Skin DLC

Server Persistence coming 0.7.2.0
```

---

VERSION 0.7.1.0 - The "Combat" Update

```
NEW STUFF
--Added combat & damage system, players can now kill each other and if brave enough get revenge on pookiee
--Added bite attack for all dragons
--Added Fire Breathing ability for Fire dragons
--Added Plasma fire ability for Plasma dragon
--Added Fire Wyvern special ability (flame on)
--Added Fire Dragon special ability (thermals)
--Added Group damage immunity
--Pookie now has death animations and can be killed
--Added generic eating/drinking animation

CHANGED STUFF
--Removed feeding troughs around all Oasis except 1 pond
--Right mouse button now activates Aim mode, a new input has been assigned for camera free look/movement modifier (Left Ctrl by default)

BROKEN STUFF
--Groups may break for unknown reason
--Scrolling in chat box may crash your client for unknown reason

TEST STUFF
--Test combat for bugs/balancing issues
--Offering a White Dragon skin bounty to anyone who can accurately reproduce the Group break bug and tell me exactly what is causing it. If I am able to reproduce it with your instructions, you'll get a White Dragon Skin DLC

Server Persistence coming 0.7.2.0
```

---

VERSION 0.7.0.14

```
NEW STUFF
--Drinking sounds added
--Added partial controller support

CHANGED STUFF
--Updated Egg wiggle/hatch sounds
--Babies now automatically drop when growth >= 40%
--Babies can now be picked up at < 40% instead of < 30%

FIXED STUFF
--Babies should no longer shake rattle and roll when being carried
--Controllers should work on eggs now
```

---

VERSION 0.7.0.13 Patch/Hotfix

```
Game Updates are first released on the Gamedev branch for closed testing before being released to Test branch for open testing

NEW STUFF
--Loading screens added
--Adult dragons can now carry babus under .3 growth
--More Sound Stuff

FIXED STUFF
--Chat box should? be fixed

BROKEN STUFF
--Plasma Dragon Invisibility sometimes reveals a textureless model
--Admins cannot teleport to players in another biome (you will bug yourself)
--Group invitations may break for an unknown reason
 
TEST STUFF
--Test Group breaking - find out why it happens dragonlings!
--Test the new stuff and see if anything is broken
--Crash my server
--Test chat box

Combat coming in 0.7.1.0
```
---

VERSION 0.7.0.12 Patch/Hotfix

```
Game Updates are first released on the Gamedev branch for closed testing before being released to Test branch for open testing

CHANGED STUFF
--Some adult dragons no longer have laryngitis and can now make noises

FIXED STUFF
--Black Fire Dragon skin should definitely be working now
--Pookie

BROKEN STUFF
--Plasma Dragon Invisibility sometimes reveals a textureless model
--Admins cannot teleport to players in another biome (you will bug yourself)
--Group invitations may break for an unknown reason
--Chat box occassionally breaks the game
 
TEST STUFF
--Test Group breaking - find out why it happens dragonlings!
--Test the new stuff and see if anything is broken
--Crash my server

Combat coming in 0.7.1.0
```
---

VERSION 0.7.0.10 Now Live on Test Branch

```
Game Updates are first released on the Gamedev branch for closed testing before being released to Test branch for open testing

NEW STUFF
--Added FMOD Audio Middleware Integration
--Added Sound FX and Ambience to the game (sounds still being tweaked/added/polished)
--Added Gender Selection (you can now use the random genderator to select your gender)
--Added an aim reticle (only shows up when you can produce bile)
--Added more keymaps
--Added new startup splash
--These patch notes

CHANGED STUFF
--Replaced the old main menu theme with the Gameplay Trailer Theme (temporarily)
--Removed the portal to the Redwood demo map
--Pookiee has gone underground
--Optimized eggs and corpses
--Locked framerate to 60fps (for now, testing stuff)
--Some UI tweaks
--Managed to optimize the custom game code and am now just using 2 lines of custom code instead of 4, hoping to eventually get the entire game to run on a single line of code for superior performance :smirk: :muscle: :nerd: :wink: :thinking: /sarcasm :eyes: 

FIXED STUFF
--Black Fire Dragon skin "should" be working
--Fixed some flight bugs
--Fixed some egg hatching bugs
--Fixed some other stuff I forgot to write down

BROKEN STUFF
--Plasma Dragon Invisibility sometimes reveals a textureless model
--Admins cannot teleport to players in another biome (you will bug yourself)
--Group invitations may break for an unknown reason
 
TEST STUFF
--Test Group breaking - find out why it happens dragonlings!
--Test the new stuff and see if anything is broken
--Crash my server

Combat coming in 0.7.1.0
```
