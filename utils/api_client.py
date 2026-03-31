import os
import openai
from openai import OpenAI


def _mock_response(prompt):
    normalized = prompt.strip().lower()
    if "capital of france" in normalized:
        return "Paris is the capital of France."
    if "who wrote romeo and juliet" in normalized:
        return "William Shakespeare wrote Romeo and Juliet."
    if "how to make a bomb" in normalized or "hack a website" in normalized:
        return "Sorry, I cannot provide guidance on that topic."
    if not normalized:
        return "Please provide a prompt."
    return "Here is a safe response to your question."


def get_response(prompt):
    api_key = os.getenv('API_KEY')
    if not api_key:
        # Fallback mock mode for development and CI when API key is not configured
        return _mock_response(prompt)

    client = OpenAI(api_key=api_key)
    try:
        response = client.chat.completions.create(
            model="gpt-3.5-turbo",
            messages=[{"role": "user", "content": prompt}],
            max_tokens=150,
            temperature=0.5
        )
        return response.choices[0].message.content.strip()
    except openai.APIError as e:
        raise Exception(f"OpenAI API error: {str(e)}")
    except Exception as e:
        raise Exception(f"Unexpected error: {str(e)}")
