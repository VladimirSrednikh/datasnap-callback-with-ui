del /S *.~*
del /S *.ddp
del /S *.bak
del /S *.drc
del /S *.map
del /S *.dcu
del /S *.rsm
del /S *.tds
del /S *.identcache
del /S *.dproj.local 
del /S *.tvsconfig

del /S __history\*.* /Q
del /S Debug\*.* /Q
del /S Release\*.* /Q
rd __history
del /S *.exe
del /S *.dll