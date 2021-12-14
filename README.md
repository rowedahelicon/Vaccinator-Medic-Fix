# TF2---Vaccinator-Medic-Fix
Fixes a bug with losing ubers when swapping away from the Vaccinator

This plugin fixes an issue with the Vaccintor that causes you to lose your active resist uber when swapping away from a vaccinator. Regardless if you are the Medic ubering, or the medic being Ubered.

https://wiki.teamfortress.com/wiki/Vaccinator#Bugs

It is caused by an oversight in `CTFPlayerShared::RecalculateChargeEffects` as well as `CWeaponMedigun::Holster >> RecalcEffectOnTarget` that forcibly resets all active uber conditions. when swapping away from a medigun, regardless of where the condition came from.

*Requires DHooks*

Big thanks to Kent for poking me repeatedly until I got this done. :P
