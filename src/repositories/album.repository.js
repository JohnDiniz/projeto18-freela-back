import { db } from "../database/db.connection.js";

export async function getAlbumsDB() {
  try {
    const query = "SELECT * FROM albums";
    const result = await db.query(query);
    return result.rows;
  } catch (err) {
    throw err;
  }
}

export async function getAlbumByIdDB(albumId) {
  try {
    const query = "SELECT * FROM albums WHERE id = $1";
    const result = await db.query(query, [albumId]);
    return result.rows[0] || null;
  } catch (err) {
    throw err;
  }
}

export async function addAlbumDB(album) {
  try {
    const query =
      "INSERT INTO albums (id, title, categories, description, imgurl, sold, price) VALUES ($1, $2, $3, $4, $5, $6, $7)";
    const values = [
      album.id,
      album.title,
      album.categories,
      album.description,
      album.imgurl,
      album.sold,
      album.price,
    ];

    await db.query(query, values);
  } catch (err) {
    throw err;
  }
}

export async function updateAlbumDB(album) {
  try {
    const query =
      "UPDATE albums SET title = $2, categories = $3, description = $4, imgurl = $5, sold = $6, price = $7 WHERE id = $1";
    const values = [
      album.id,
      album.title,
      album.categories,
      album.description,
      album.imgurl,
      album.sold,
      album.price,
    ];

    await db.query(query, values);
  } catch (err) {
    throw err;
  }
}

export async function searchAlbumsDB(searchTerm) {
  try {
    const query = `
      SELECT * FROM albums
      WHERE title ILIKE $1 OR description ILIKE $1
    `;
    const values = [`%${searchTerm}%`];

    const { rows } = await db.query(query, values);
    return rows;
  } catch (err) {
    throw err;
  }
}
