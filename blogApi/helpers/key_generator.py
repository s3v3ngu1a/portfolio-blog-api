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

# print(generate_api_keys('sergio', 'sergio@sergio.com'))
api_id, api_key = generate_api_keys('sergio', 'sergio@sergio.com')

api_id_hash = generate_password_hash(api_id)
api_key_hash = generate_password_hash(api_key)

print("api_id: {}".format(api_id))
print("api_key: {}".format(api_key))
print("####################")
print("hash to save id: {}".format(api_id_hash))
print("hash to save key: {}".format(api_key_hash))
print("####################")
print("id match: {}".format(check_password_hash(api_id_hash, api_id)))
print("secret match: {}".format(check_password_hash(api_key_hash, api_key)))
