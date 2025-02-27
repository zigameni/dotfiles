
import {Schema, models, model, Document} from 'mongoose';
import { string } from 'zod';

// Re-defining the interface for Mongoose compatibility - optional but good for type safety
export interface IAnswer extends Document {
  author: Schema.Types.ObjectId;
  question: Schema.Types.ObjectId;
  content: string;
  upvotes: Schema.Types.ObjectId[];
  downvotes: Schema.Types.ObjectId[];
  createdAt: Date;
}

const AnswerSchema: Schema = new Schema({
  author: { Schema.Types.ObjectId, ref:'User', required: true},
  question: { Schema.Types.ObjectId, ref:'Question', required: true},
  content: {type: String, required: true},
  upvotes: [{type: Schema.Types.ObjectId, ref: 'User'}],
  downvotes: [{type: Schema.Types.ObjectId, ref: 'User'}],
  createdAt: {type: Date, default: Date.now},
});

const Answer = models.Answer || model('Answer', AnswerSchema);

export default Answer;