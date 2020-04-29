# FreeEncryptor-Swift

Cryptography is hard, it's especially hard to do it properly.

This library (hopefull) makes it easy to encrypt / decrypt any given String or Data for people who know very little about cryptography.

## The general workflow of encryption / decryption

The encryption process is as the following:

1. We need a password as the key to encrypt the data.
2. However, the password a user chose, is usually too weak to use directly as the encryption key. So we generate the real encryption key via a key derivation algorithm called [PBKDF2](https://en.wikipedia.org/wiki/PBKDF2), using the password itself and a randomly generated 32 bytes data (AKA *salt*). By default, we perform 65536 iterations of key derivation to make the key is very hard if not impossible to break via brute force.
3. We also need some verification mechanism, so that we would know if the provided password was right during decryption. We do this by generating another random 32 bytes data (AKA *IV*), and use both the *encryption key* and this *IV* to encrypt the data using an encryption algorithm called AES-GCM.
4. Finally, we save the *salt* and the *IV* as plain text, along with the encrypted data.

The decryption process is as the following:

1. We get the password from user.
2. We fetch the *salt* from disk, and regenerate the encryption key using the same process as we did in encryption, to get an encryption key.
3. We use the generated key, along with the previously saved *IV*, to perform the decryption on encrypted data. Because we have this *IV*, we would know if the decryption was successful or not. And if the decryption failed, that would mean the provided password by the user was incorrect.

## How to use

To encrypt a piece of data using a given password:

`Encryptor.encrypt(password: String, plainData: [UInt8])`

To decrypt a piece of data using a given password:

`Encryptor.decrypt(password: String, encryptedData: Data)`
