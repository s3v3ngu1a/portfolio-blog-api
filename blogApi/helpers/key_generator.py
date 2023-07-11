import secrets
import hashlib
from werkzeug.security import check_password_hash, generate_password_hash

def generate_api_keys(username, email):
    # Generate a seed from username and email
    seed = f"{username}{email}{secrets.token_hex(8)}".encode('utf-8')

    # Create a SHA256 hash object
    hasher = hashlib.sha256(seed)

    # Generate API key (public key)
    api_key = hasher.hexdigest()[:37]

    # Generate secret key
    secret_key = secrets.token_hex(37)

    return api_key, secret_key