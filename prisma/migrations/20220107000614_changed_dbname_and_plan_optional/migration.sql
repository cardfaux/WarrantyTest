/*
  Warnings:

  - Added the required column `scope` to the `User` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `User` DROP FOREIGN KEY `User_plan_id_fkey`;

-- AlterTable
ALTER TABLE `User` ADD COLUMN `scope` VARCHAR(191) NOT NULL,
    MODIFY `plan_id` INTEGER NULL;

-- AddForeignKey
ALTER TABLE `User` ADD CONSTRAINT `User_plan_id_fkey` FOREIGN KEY (`plan_id`) REFERENCES `Plan`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;
