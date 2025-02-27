
import {Schema, models, model, Document} from 'mongoose';

// Re-defining the interface for Mongoose compatibility - optional but good for type safety
export interface IAnswer extends Document {


}

const AnswerSchema: Schema = new Schema({


});

const Answer = models.Answer || model('Answer', AnswerSchema);

export default Answer;