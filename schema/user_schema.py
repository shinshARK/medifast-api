from pydantic import BaseModel

class CreateUserRequest(BaseModel):
    firstname: str
    lastname: str
    telephone: str
    email: str
    password: str


class LoginUserRequest(BaseModel):
    email: str
    password: str