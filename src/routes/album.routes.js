import { Router } from "express";
import {
  getAlbumById,
  getAlbums,
  addAlbum,
  updateAlbum,
  searchAlbums,
} from "../controllers/album.controller.js";

const albumRouter = Router();

albumRouter.get("/albums", getAlbums);
albumRouter.get("/albums/:id", getAlbumById);
albumRouter.post("/albums", addAlbum);
albumRouter.put("/albums/:id", updateAlbum);
albumRouter.get("/searchAlbums", searchAlbums);

export default albumRouter;
