;+
; NAME:
;       SET_PS
;
; PURPOSE:
;       This procedure makes PostScript the active plotting device.
;
; CATEGORY:
;       Devices.
;
; CALLING SEQUENCE:
;       SET_PS
;
; KEYWORD PARAMETERS:
;       QUEUE:  Printer queue to send PostScript output. Default is last choice.
;       XSIZE:  Horizontal page size in inches. Default is 7 (10 in landscape).
;       YSIZE:  Vertical page size in inches.  Default is 10 (7 in landscape).
;       BIT:    Number of bits per pixel.  Default is 1.
;       FILE:   File specs for PostScript output.  Default is 'idl.ps'.
;       LANDSCAPE: Set this parameter for landscape output. Default is portrait.
;
; COMMON BLOCKS:
;       PS_COMMON: Contains queue name and file used for printing.
;
; SIDE EFFECTS:
;       Sets device to PostScript and uses hardware font 
;         Helvetica Bold 14 Point and uses thicker plot line.
;
; EXAMPLE:
;       SET_X
;       ...
;       ... [IDL commands to the X device]
;       ...
;       SET_PS, QUEUE='901'
;       ...
;       ... [IDL commands to the PostScript device]
;       ...
;       SET_X 
;       [PostScript output is closed and printed on Queue 901]
;
; MODIFICATION HISTORY:
;        Written by:       Harvey Rarback, April 7, 1993
;-

pro set_ps, queue = queue,                $
            xsize = xsize, ysize = ysize, $
            bit = bit, file = file,       $
            landscape = landscape

common ps_common, ps_queue, ps_file

set_plot, 'PS' & !p.font = 0 & !p.thick = 3.

if n_elements( queue)    ne 0 then ps_queue = queue
if n_elements( ps_queue) eq 0 then get_ps_queue
if n_elements( xsize)    eq 0 then begin
   if keyword_set(landscape) then xsize = 10. else xsize=7.
endif
if n_elements( ysize)    eq 0 then begin
    if keyword_set(landscape) then ysize = 7. else ysize=10.
endif
if n_elements( bit)      eq 0 then bit = 1
if n_elements( file)     ne 0 then ps_file = file
if n_elements( ps_file)  eq 0 then ps_file = 'idl.ps'

if keyword_set( landscape) then                                             $
  device, xoff = .75, yoff = 10.25, xsize = xsize, ysize = ysize, /inch, /land $
else                                                                        $
  device, xoff = .75, yoff = .75, xsize = xsize, ysize = ysize, /inch

device, font_size = 14, /helvetica, /bold, bit = bit, file = ps_file

end
