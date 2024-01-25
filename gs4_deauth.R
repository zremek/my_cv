# to change:

if(sheet_is_publicly_readable){
  # This tells google sheets to not try and authenticate. Note that this will only
  # work if your sheet has sharing set to "anyone with link can view"
  googlesheets4::gs4_deauth() # this line works