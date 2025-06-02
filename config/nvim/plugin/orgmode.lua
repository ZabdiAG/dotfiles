require('orgmode').setup({
  org_agenda_files = {'~/code/org/*.org'},

  org_default_notes_file = '~/code/org/default.org',

  org_capture_templates = {
   t = {
     description = 'Task',
     template = '* TODO %?\n  %u',
     target = '~/code/org/tasks.org',
   },
   n = {
     description = 'Note',
     template = '* %u %?\n',
     target = '~/code/org/notes.org',
   },
  },
})


require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = {'org'}, -- This line is needed
  },
  --ensure_installed = {'org'},
}
