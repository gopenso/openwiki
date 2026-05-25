"""Opencode ModelClient - thin wrapper around OpenAIClient for opencode.ai."""

from api.openai_client import OpenAIClient


class OpencodeClient(OpenAIClient):
    def __init__(self, *args, **kwargs):
        kwargs.setdefault("base_url", "https://opencode.ai/zen/go/v1")
        kwargs.setdefault("env_api_key_name", "OPENCODE_API_KEY")
        super().__init__(*args, **kwargs)
