" Set up ALE to use Prettier for specific languages
let g:ale_fixers = {
			\ 'javascript': ['eslint'],
			\ 'typescript': ['prettier'],
			\ 'css': ['prettier'],
			\ 'less': ['prettier'],
			\ 'scss': ['prettier'],
			\ 'json': ['prettier'],
			\ 'graphql': ['prettier'],
			\ 'markdown': ['prettier'],
			\ 'vue': ['prettier'],
			\ 'yaml': ['prettier'],
			\ 'html': ['prettier']
			\}
" Tell ALE to use OmniSharp for linting C# files, and no other linters.
let g:ale_linters = { 'cs': ['OmniSharp'] }

" let g:ale_linters_explicit = 1
let g:ale_fix_on_save = 1
" let g:ale_javascript_prettier_options = '--single-quote --tab-width 2'
