import { db } from "../database/db.connection.js";

export function getUserByEmailDB(email) {
  return db.query(`SELECT * FROM users WHERE email=$1;`, [email]);
}

export function getCompleteUserDB(userId) {
  return db.query(
    `
        SELECT users.id, users.name, SUM(urls."visitCount") AS "visitCount", 
                JSON_AGG(
                    JSON_BUILD_OBJECT('id', urls.id, 'url', urls.url, 'shortUrl', urls."shortUrl", 'visitCount', urls."visitCount")
                ) AS "shortenedUrls"
            FROM users 
            JOIN urls ON users.id = urls."userId"
            WHERE users.id=$1
            GROUP BY users.id, users.name;`,
    [userId]
  );
}

export function createUserDB(name, email, password) {
  return db.query(
    `INSERT INTO users (name, email, password) VALUES ($1, $2, $3);`,
    [name, email, password]
  );
}

export async function getUserByIdDB(userId) {
  try {
    const query = "SELECT * FROM public.users WHERE id = $1";
    const values = [userId];

    const result = await db.query(query, values);

    return result;
  } catch (error) {
    throw error;
  }
}
