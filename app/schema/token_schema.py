from pydantic import BaseModel
from datetime import datetime

class CreateTokenRequest(BaseModel):
    user_id: str
    access_token: str
    refresh_token: str
    status: bool
    created_date: datetime