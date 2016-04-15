require_relative 'female-short-names.rb'
require_relative 'female-long-names.rb'
require_relative 'male-short-names.rb'
require_relative 'male-long-names.rb'
require_relative 'unisex-names.rb'

include ListOfFemaleShortNames
include ListOfFemaleLongNames
include ListOfMaleShortNames
include ListOfMaleLongNames
include ListOfUnisexNames

def gender_select(gender, length, strong, unique, outrageous, meaningful)
  if(gender=="boy" && length.to_i == 0)
    general_list = $male_short
    strong_list = $male_short_strong
    unique_list = $male_short_unique
    outrageous_list = $male_short_outrageous
    meaningful_list = $male_short_meaningful
  elsif(gender=="boy" && length == "1")
    general_list = $male_long
    strong_list = $male_long_strong
    unique_list = $male_long_unique
    outrageous_list = $male_long_outrageous
    meaningful_list = $male_long_meaningful
  elsif(gender=="girl" && length.to_i == 0)
    general_list = $female_short
    strong_list = $female_short_strong
    unique_list = $female_short_unique
    outrageous_list = $female_short_outrageous
    meaningful_list = $female_short_meaningful
  elsif(gender=="girl" && length == "1")
    general_list = $female_long
    strong_list = $female_long_strong
    unique_list = $female_long_unique
    outrageous_list = $female_long_outrageous
    meaningful_list = $female_long_meaningful
  elsif(gender=="unisex" && length.to_i == 0)
    general_list = $unisex_long
    strong_list = $male_long_strong|$female_long_strong
    unique_list = $male_long_unique|$female_long_unique
    outrageous_list = $male_long_outrageous|$female_long_outrageous
    meaningful_list = $male_long_meaningful|$female_long_meaningful
  elsif(gender=="unisex" && length =="1")
    general_list = $unisex_short
    strong_list = $male_short_strong|$female_short_strong
    unique_list = $male_short_unique|$female_short_unique
    outrageous_list = $male_short_outrageous|$female_short_outrageous
    meaningful_list = $male_short_meaningful|$female_short_meaningful
  elsif(length=="0")
    general_list = $unisex_short|$unisex_long|$male_short|$male_long|$female_short|$female_long
    strong_list = $male_short_strong|$female_short_strong
    unique_list = $male_short_unique|$female_short_unique
    outrageous_list = $male_short_outrageous|$female_short_outrageous
    meaningful_list = $male_short_meaningful|$female_short_meaningful
  elsif(length=="1")
    general_list = $unisex_short|$unisex_long|$male_short|$male_long|$female_short|$female_long
    strong_list = $male_long_strong|$female_long_strong
    unique_list = $male_long_unique|$female_long_unique
    outrageous_list = $male_long_outrageous|$female_long_outrageous
    meaningful_list = $male_long_meaningful|$female_long_meaningful
  end
  name_select(strong, unique, outrageous, meaningful, general_list, strong_list, unique_list, outrageous_list, meaningful_list)
end

def name_select(strong, unique, outrageous, meaningful, general_list, strong_list, unique_list, outrageous_list, meaningful_list)
  #NOTHING SELECTED
  if(strong.to_i == 0 && unique.to_i == 0 && outrageous.to_i == 0 && meaningful.to_i== 0)
    random_name = general_list.sample
  #ONE THING SELECTED
  elsif(strong.to_i == 1 && unique.to_i == 0 && outrageous.to_i == 0 && meaningful.to_i== 0)
    random_name = strong_list.sample
  elsif(strong.to_i == 0 && unique.to_i == 1 && outrageous.to_i == 0 && meaningful.to_i== 0)
    random_name = unique_list.sample
  elsif(strong.to_i == 0 && unique.to_i == 0 && outrageous.to_i == 1 && meaningful.to_i== 0)
    random_name = outrageous_list.sample
  elsif(strong.to_i == 0 && unique.to_i == 0 && outrageous.to_i == 0 && meaningful.to_i== 1)
    random_name = meaningful_list.sample
  #TWO THINGS SELECTED
  elsif(strong.to_i == 1 && unique.to_i == 1 && outrageous.to_i == 0 && meaningful.to_i== 0)
    random_name = (strong_list|unique_list).sample
  elsif(strong.to_i == 1 && unique.to_i == 0 && outrageous.to_i == 1 && meaningful.to_i== 0)
    random_name = (strong_list|outrageous_list).sample
  elsif(strong.to_i == 1 && unique.to_i == 0 && outrageous.to_i == 0 && meaningful.to_i== 1)
    random_name = (strong_list|meaningful_list).sample
  elsif(strong.to_i == 0 && unique.to_i == 1 && outrageous.to_i == 1 && meaningful.to_i== 0)
    random_name = (unique_list|outrageous_list).sample
  elsif(strong.to_i == 0 && unique.to_i == 1 && outrageous.to_i == 0 && meaningful.to_i== 1)
    random_name = (unique_list|meaningful_list).sample
  elsif(strong.to_i == 0 && unique.to_i == 0 && outrageous.to_i == 1 && meaningful.to_i== 1)
    random_name = (outrageous_list|meaningful_list).sample
    #THREE THINGS SELECTED
  elsif(strong.to_i == 0 && unique.to_i == 1 && outrageous.to_i == 1 && meaningful.to_i== 1)
    random_name = (unique_list|outrageous_list|meaningful_list).sample
  elsif(strong.to_i == 1 && unique.to_i == 0 && outrageous.to_i == 1 && meaningful.to_i== 1)
    random_name = (unique_list|outrageous_list|meaningful_list).sample  
  elsif(strong.to_i == 1 && unique.to_i == 1 && outrageous.to_i == 0 && meaningful.to_i== 1)
    random_name = (unique_list|outrageous_list|meaningful_list).sample
  elsif(strong.to_i == 1 && unique.to_i == 1 && outrageous.to_i == 1 && meaningful.to_i== 0)
    random_name = (unique_list|outrageous_list|meaningful_list).sample  
    #FOUR THINGS SELECTED
  elsif(strong.to_i == 1 && unique.to_i == 1 && outrageous.to_i == 1 && meaningful.to_i== 1)
    random_name = (strong_list|unique_list|outrageous_list|meaningful_list).sample  
  else
    random_name = "you done messed up Mr. Budi"
  end
  return random_name
end