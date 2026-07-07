import express from "express";
import { addKid, getKidsOf, callKid, confirmKid } from "./kids.js";
import {
  validateAddingKid,
  validateGetKidsOf,
  validateCallKid,
  validateConfirmKid,
} from "./validators.js";

export const router = express.Router();

router.post("/", validateAddingKid, addKid);

router.get("/:id", validateGetKidsOf, getKidsOf);

router.post("/:id/call", validateCallKid, callKid);

router.post("/:id/confirm", validateConfirmKid, confirmKid);

