import React from 'react'
import { useForm } from 'react-hook-form'
import { Form } from '../ui/form';

const Answer = () => {
  const form = useForm<z.infer<typeof AnswerSchema>>();

  return (
    <Form>
      
    </Form>
  )
}

export default Answer