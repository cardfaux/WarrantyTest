/*
  Warnings:

  - You are about to drop the column `dynamic` on the `question` table. All the data in the column will be lost.
  - Added the required column `user_id` to the `question` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `question` DROP COLUMN `dynamic`,
    ADD COLUMN `user_id` INTEGER NOT NULL,
    ADD COLUMN `views` INTEGER NOT NULL DEFAULT 0;

-- CreateIndex
CREATE INDEX `question_user_id_idx` ON `question`(`user_id`);

-- AddForeignKey
ALTER TABLE `question` ADD CONSTRAINT `question_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `user`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- RenameIndex
ALTER TABLE `question` RENAME INDEX `question_faq_id_fkey` TO `question_faq_id_idx`;
