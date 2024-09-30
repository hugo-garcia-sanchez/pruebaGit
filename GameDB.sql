--cambio v2

-- Drop the database if it already exists
DROP DATABASE IF EXISTS GameDB;

-- Create a new database
CREATE DATABASE GameDB;

-- Use the newly created database
USE GameDB;

-- Create a table for users (avoiding the reserved word 'User')
CREATE TABLE Player (
    playerId INT PRIMARY KEY NOT NULL, -- Player ID, primary key and required field
    username VARCHAR(255) NOT NULL, -- Username, required field
    password VARCHAR(255) NOT NULL, -- Password, required field
    score INT NOT NULL -- Player's score, required field
)ENGINE = InnoDB;

-- Create a table for game sessions
CREATE TABLE GameTable (
    tableId INT PRIMARY KEY NOT NULL, -- Table ID, primary key and required field
    playerCount INT NOT NULL, -- Number of players, required field
    cardCount INT NOT NULL, -- Number of cards, required field
    endDateTime VARCHAR(255) NOT NULL, -- End date and time of the game, required field
    durationMinutes INT NOT NULL, -- Game duration in minutes, required field
    winnerId INT NOT NULL -- Winner's player ID, required field
)ENGINE = InnoDB;

-- Create a table for player-game relationships
CREATE TABLE PlayerGameRelation (
    playerId INT NOT NULL, -- Player's ID
    tableId INT NOT NULL, -- Game table ID
    FOREIGN KEY (playerId) REFERENCES Player(playerId), -- Foreign key referencing Player table
    FOREIGN KEY (tableId) REFERENCES GameTable(tableId) -- Foreign key referencing GameTable table
)ENGINE = InnoDB;