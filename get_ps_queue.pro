pro get_ps_queue

common ps_common, ps_queue, ps_file

ok = ['gse_floor', 'gse_lom','aps_4mv', 'sutton', 'phaser', 'none']
ps_queue = ok( get_choice( 'Printer queue for PostScript output', ok, 0))
end
