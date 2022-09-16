const mongoose = require('mongoose');
const { Schema } = mongoose;

const questionsSchema = new Schema({
  product_id: Number,
  results: [{
    question_id: Number,
    question_body: String,
    question_date: Number,
    asker_name: String,
    asker_email: String,
    question_helpfulness: Number,
    reported: Boolean
  }]
});

const answersSchema = new Schema({
  question_id: Number,
  results: [{
    answer_id: Number,
    body: String,
    date: Number,
    answerer_name: String,
    answerer_email: String,
    reported: Boolean,
    helpfulness: Number
  }]
});

const photosSchema = new Schema({
  id: Number,
  answer_id: Number,
  url: String
})