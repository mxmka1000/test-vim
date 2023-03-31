function! CreatePyrightConfig()
  let venv_path = input('Enter the path to the virtual environment: ')
  let python_path = venv_path . '/bin/python'
  let pyright_config = {
        \ 'venv': venv_path,
        \ 'pythonPath': python_path,
        \ 'venvPath': venv_path
        \ }
  let config_file = findfile('pyrightconfig.json', '.;')
  if empty(config_file)
    let config_file = expand('%:p:h') . '/pyrightconfig.json'
  endif
  call writefile([json_encode(pyright_config)], config_file)
endfunction

command! PyrightConfig call CreatePyrightConfig()