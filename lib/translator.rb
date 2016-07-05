# require modules here
require 'yaml'
require 'pry'

def load_library(filepath)
  # code goes here
  #binding.pry
  emoticons = YAML.load_file(filepath)
  #binding.pry

  meaning_hash = Hash.new
  emoticon_hash = Hash.new

  emoticons.each do |meaning, emoticons|
    meaning_hash[emoticons[1]] = meaning
    emoticon_hash[emoticons[0]] = emoticons[1]
  end

  result = {"get_emoticon" => emoticon_hash, "get_meaning" => meaning_hash}
end

def get_japanese_emoticon(filepath, english_emoticon)
  emoticons = load_library(filepath)
  #binding.pry
  if emoticons["get_emoticon"].keys.include?(english_emoticon)
    emoticons["get_emoticon"][english_emoticon]
  else
    "Sorry, that emoticon was not found"
  end
  # code goes here
end

def get_english_meaning(filepath, japanese_emoticon)
  emoticons = load_library(filepath)
  #binding.pry
  if emoticons["get_meaning"].keys.include?(japanese_emoticon)
    emoticons["get_meaning"][japanese_emoticon]
  else
    "Sorry, that emoticon was not found"
  end
  # code goes here
end