# update site url global rank and locval ran k and display in chart 
every :day, at: '12pm' do
  runner 'LoggerJob.perform_async'
end
