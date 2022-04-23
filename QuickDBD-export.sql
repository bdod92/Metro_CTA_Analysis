-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.
-- This was all auto generated from QuickDBD. Cool ERD tool.

CREATE TABLE "classes" (
    "class_id" INTEGER   NOT NULL,
    "trainer_id" INTEGER   NOT NULL,
    "gym_id" INTEGER   NOT NULL,
    "class_name" VARCHAR   NOT NULL,
    "commission_percentage" FLOAT   NOT NULL,
    CONSTRAINT "pk_classes" PRIMARY KEY (
        "class_id"
     )
);

CREATE TABLE "class_attendance" (
    "member_id" INTEGER   NOT NULL,
    "class_id" INTEGER   NOT NULL,
    CONSTRAINT "pk_class_attendance" PRIMARY KEY (
        "member_id"
     )
);

CREATE TABLE "gym" (
    "gym_id" INTEGER   NOT NULL,
    "gym_Name" VARCHAR   NOT NULL,
    "address" VARCHAR   NOT NULL,
    "city" VARCHAR   NOT NULL,
    "zipcode" VARCHAR   NOT NULL,
    CONSTRAINT "pk_gym" PRIMARY KEY (
        "gym_id"
     )
);

CREATE TABLE "trainers" (
    "trainer_id" INTEGER   NOT NULL,
    "gym_id" INTEGER   NOT NULL,
    "first_name" VARCHAR   NOT NULL,
    "last_name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_trainers" PRIMARY KEY (
        "trainer_id"
     )
);

CREATE TABLE "members" (
    "member_id" INTEGER   NOT NULL,
    "gym_id" INTEGER   NOT NULL,
    "trainer_id" INTEGER   NOT NULL,
    "first_name" VARCHAR   NOT NULL,
    "last_name" VARCHAR   NOT NULL,
    "address" VARCHAR   NOT NULL,
    "city" VARCHAR   NOT NULL,
    CONSTRAINT "pk_members" PRIMARY KEY (
        "member_id"
     )
);

CREATE TABLE "payments" (
    "payment_id" INTEGER   NOT NULL,
    "member_id" INTEGER   NOT NULL,
    "creditcard_info" INTEGER   NOT NULL,
    "billing_zip" INTEGER   NOT NULL,
    CONSTRAINT "pk_payments" PRIMARY KEY (
        "payment_id"
     )
);

ALTER TABLE "class_attendance" ADD CONSTRAINT "fk_class_attendance_member_id" FOREIGN KEY("member_id")
REFERENCES "members" ("member_id");

ALTER TABLE "class_attendance" ADD CONSTRAINT "fk_class_attendance_class_id" FOREIGN KEY("class_id")
REFERENCES "classes" ("class_id");

ALTER TABLE "trainers" ADD CONSTRAINT "fk_trainers_gym_id" FOREIGN KEY("gym_id")
REFERENCES "gym" ("gym_id");

ALTER TABLE "members" ADD CONSTRAINT "fk_members_gym_id" FOREIGN KEY("gym_id")
REFERENCES "gym" ("gym_id");

ALTER TABLE "members" ADD CONSTRAINT "fk_members_trainer_id" FOREIGN KEY("trainer_id")
REFERENCES "trainers" ("trainer_id");

ALTER TABLE "payments" ADD CONSTRAINT "fk_payments_member_id" FOREIGN KEY("member_id")
REFERENCES "members" ("member_id");

insert into trainers
(trainer_id, gym_id, first_name, last_name)
values (1, 1, 'Patches', 'O''Houlihan');

insert into gym
(gym_id, gym_name, address, city, zipcode)
values (1, 'Average Joe''s Gymnasium', '123 Main St.', 'Springfield', '12345');

insert into classes
(class_id, trainer_id, gym_id, class_name, commission_percentage)
values (1,1,1,'Wrench Dodging',0.1);

