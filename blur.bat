@echo off
for %%f in (*.jpg *.cr2 *.psd) do (
	magick "%%f" -statistic StandardDeviation 15x15 -format "%%[fx:maxima]" info:
	echo  ^<^<^< %%f
)
pause