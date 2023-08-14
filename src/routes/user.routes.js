import { Router } from "express";
import { getUserInfo } from "../controllers/auth.controller.js";
import { validateAuth } from "../middlewares/validateAuth.js";

const userRouter = Router();

userRouter.get("/users/me", validateAuth, getUserInfo);

export default userRouter;
