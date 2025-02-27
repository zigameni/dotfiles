
import {Schema, models, model, Document} from 'mongoose';

// Re-defining the interface for Mongoose compatibility - optional but good for type safety
export interface IAnswer extends Document {
    title: string;
    content: string;
    tags: Schema.Types.ObjectId[];
    views: number;
    upvotes: Schema.Types.ObjectId[];
    downvotes: Schema.Types.ObjectId[];
    author: Schema.Types.ObjectId;
    answers: Schema.Types.ObjectId[];
    createdAt: Date;
}

const AnswerSchema: Schema = new Schema({
    title: { type: String, required: true },
    content: { type: String, required: true },
    tags: [{ type: Schema.Types.ObjectId, ref: 'Tag' }],
    views: { type: Number, default: 0 },
    upvotes: [{ type: Schema.Types.ObjectId, ref: 'User' }],
    downvotes: [{ type: Schema.Types.ObjectId, ref: 'User' }],
    author: { type: Schema.Types.ObjectId, ref: 'User', required: true },
    answers: [{ type: Schema.Types.ObjectId, ref: 'Answer' }],
    createdAt: { type: Date, default: Date.now },
});

const Answer = models.Answer || model('Answer', AnswerSchema);

export default Answer;