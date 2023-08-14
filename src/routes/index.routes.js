import { Router } from "express";
import authRouter from "./auth.routes.js";
import userRouter from "./user.routes.js";
import albumRouter from "./album.routes.js";

const router = Router();

router.use(authRouter);
router.use(userRouter);
router.use(albumRouter);

export default router;
