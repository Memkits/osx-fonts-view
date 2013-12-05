
require('calabash').do 'watch compile',
  'pkill -f doodle',
  'coffee -o src/ -wc coffee/'
  'doodle index.html src/ cirru/'