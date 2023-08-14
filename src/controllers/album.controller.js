import { v4 as uuid } from "uuid";
import bcrypt from "bcrypt";
import {
  createUserDB,
  getUserByEmailDB,
  getUserByIdDB,
} from "../repositories/user.repository.js";
import { createSessionDB } from "../repositories/auth.repository.js";
import {
  getAlbumsDB,
  getAlbumByIdDB,
  addAlbumDB,
  updateAlbumDB,
} from "../repositories/album.repository.js"; // Import album-related functions

export async function getAlbums(req, res) {
  try {
    const albums = await getAlbumsDB();
    res.send(albums);
  } catch (err) {
    res.status(500).send(err.message);
  }
}

export async function getAlbumById(req, res) {
  const albumId = req.params.id; // Assuming you extract the album ID from the URL parameters

  try {
    const album = await getAlbumByIdDB(albumId);
    if (!album)
      return res.status(404).send({ message: "Álbum não encontrado!" });

    res.send(album);
  } catch (err) {
    res.status(500).send(err.message);
  }
}

export async function addAlbum(req, res) {
  const { title, categories, description, img, price } = req.body; // Added 'img' property

  try {
    const album = {
      id: uuid(),
      title,
      categories,
      description,
      img, // Added 'img' property
      sold: false,
      price,
    };

    await addAlbumDB(album); // Assuming you have a function to add an album to the database

    res.status(201).send({ message: "Álbum adicionado com sucesso!" });
  } catch (err) {
    res.status(500).send(err.message);
  }
}

export async function updateAlbum(req, res) {
  const albumId = req.params.id; // Assuming you extract the album ID from the URL parameters
  const { title, categories, description, img, price, sold } = req.body;

  try {
    const existingAlbum = await getAlbumByIdDB(albumId);
    if (!existingAlbum) {
      return res.status(404).send({ albumId });
    }

    const updatedAlbum = {
      id: albumId,
      title,
      categories,
      description,
      img,
      sold: sold !== undefined ? sold : existingAlbum.sold,
      price,
    };

    await updateAlbumDB(updatedAlbum);

    res.send({ message: "Álbum atualizado com sucesso!" });
  } catch (err) {
    res.status(500).send(err.message);
  }
}
