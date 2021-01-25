logo_icon_sizes = [
  '16x16',
  '22x22',
  '24x24',
  '32x32',
  '48x48',
  '256x256',
  'scalable',
]

misc_icon_sizes = [
  '24x24',
  'scalable',
]

misc_icon_names = [
  'usb',
]

foreach icon_size: logo_icon_sizes
  if icon_size == 'scalable'
    src_icon = 'virt-viewer.svg'
  else
    src_icon = 'virt-viewer.png'
  endif
  install_data(
    join_paths(icon_size, src_icon),
    install_dir: join_paths(datadir, 'icons', 'hicolor', icon_size, 'apps')
  )
endforeach

foreach icon_size: misc_icon_sizes
  foreach icon_name: misc_icon_names
    if icon_size == 'scalable'
      src_icon = 'virt-viewer-' + icon_name + '.svg'
    else
      src_icon = 'virt-viewer-' + icon_name + '.png'
    endif
    install_data(
      join_paths(icon_size, src_icon),
      install_dir: join_paths(datadir, 'icons', 'hicolor', icon_size, 'devices')
    )
  endforeach
endforeach


if host_machine.system() == 'windows'
  icotool = find_program('icotool')

  infiles = []
  foreach size: ['16', '32', '48', '256']
    infiles += [join_paths('@0@x@0@'.format(size), 'virt-viewer.png')]
  endforeach

  outfile = 'virt-viewer.ico'

  icofile = custom_target(
    outfile,
    output : outfile,
    input : infiles,
    command : [icotool, '-c', '-o', '@OUTPUT@', '@INPUT@'])
endif
