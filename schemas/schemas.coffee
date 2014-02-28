mongoose = require 'mongoose'
Schema = mongoose.Schema


Section = new Schema(
  title: String
  grade: String
  credits: String
  htmlId: String
)

Section = mongoose.model 'Section', Section

module.exports =
  Section : Section

