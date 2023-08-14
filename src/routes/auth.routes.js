import { Router } from "express";
import { signIn, signUp } from "../controllers/auth.controller.js";
import { validateSchema } from "../middlewares/validateSchema.js";
import { userSchema } from "../schemas/user.schemas.js";
import { authSchema } from "../schemas/auth.schemas.js";
import { getUserInfo } from "../controllers/auth.controller.js";

const authRouter = Router();

authRouter.post("/signup", validateSchema(userSchema), signUp);
authRouter.post("/signin", validateSchema(authSchema), signIn);
authRouter.post("/getUserInfo", getUserInfo);

export default authRouter;
