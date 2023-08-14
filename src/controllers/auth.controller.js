import { v4 as uuid } from "uuid";
import bcrypt from "bcrypt";
import {
  createUserDB,
  getUserByEmailDB,
  getUserByIdDB,
} from "../repositories/user.repository.js";
import { createSessionDB } from "../repositories/auth.repository.js";

export async function signUp(req, res) {
  const { name, email, password } = req.body;

  try {
    const user = await getUserByEmailDB(email);
    if (user.rowCount !== 0)
      return res.status(409).send({ message: "E-mail já foi cadastrado!" });

    const hash = bcrypt.hashSync(password, 10);
    await createUserDB(name, email, hash);

    res.sendStatus(201);
  } catch (err) {
    res.status(500).send(err.message);
  }
}

export async function signIn(req, res) {
  const { email, password } = req.body;

  try {
    const user = await getUserByEmailDB(email);
    if (user.rowCount === 0)
      return res.status(401).send({ message: "E-mail não cadastrado!" });

    const isPasswordCorrect = bcrypt.compareSync(
      password,
      user.rows[0].password
    );
    if (!isPasswordCorrect)
      return res.status(401).send({ message: "Senha incorreta!" });

    const token = uuid();
    await createSessionDB(user.rows[0].id, token);

    res.send({ id: user.rows[0].id, token });
  } catch (err) {
    res.status(500).send(err.message);
  }
}

export async function getUserInfo(req, res) {
  const userId = req.body.id;

  try {
    const user = await getUserByIdDB(userId); // Retrieve user information by ID
    if (user.rowCount === 0)
      return res.status(404).send({ message: "Usuário não encontrado!" });

    const userInfo = {
      id: user.rows[0].id,
      name: user.rows[0].name,
      email: user.rows[0].email,
      createdAt: user.rows[0].createdAt,
    };

    res.send(userInfo);
  } catch (err) {
    res.status(500).send(err.message);
  }
}
