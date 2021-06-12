-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 12, 2021 at 05:41 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hw2`
--

-- --------------------------------------------------------

--
-- Table structure for table `artworks`
--

CREATE TABLE `artworks` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `artists` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL,
  `publication_year` smallint(6) NOT NULL,
  `place_of_origin` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `artworks`
--

INSERT INTO `artworks` (`id`, `title`, `artists`, `img`, `publication_year`, `place_of_origin`, `description`, `category`) VALUES
(22, 'Villa Pamphili outside Porta S. Pancrazio, from Views of Rome', 'Giovanni Battista Piranesi (Italian, 1720-1778)\npublished by Francesco (Italian, 1758-1810) and Pietro Piranesi (Italian, born 1758/9)', 'https://www.artic.edu/iiif/2/a76844cc-cec8-6026-5609-50d3961aed4c/full/843,/0/default.jpg', 1776, 'Italy', 'A work made of etching on heavy ivory laid paper.', 'Prints and Drawings'),
(42, 'Saint James the Greater', 'Master F.P. (Italian, c. 1530-1550)\nor after Girolamo Francesco Maria Mazzola, called Il Parmigianino (Italian, 1503-1540)', 'https://www.artic.edu/iiif/2/6d0943bb-e4b6-102e-4742-0d1533f54c97/full/843,/0/default.jpg', 1550, 'Italy', 'Etching of a strong male figure with their face in profile, wearing a cloak and hat and grasping a very tall staff.', 'Prints and Drawings'),
(2581, 'Venus and Adonis (?) with the Duck Hunt', 'Presumably woven at the workshop of Jacques I Geubels (died 1601/05) or his widow Catharina van den Eynde (died before 1629)\nFlanders, Brussels', 'https://www.artic.edu/iiif/2/70cf3a07-637e-ab7e-c0e8-5678cd6d20f4/full/843,/0/default.jpg', 1610, 'Flanders', 'A work made of wool and silk, slit and double interlocking tapestry weave.', 'Textiles'),
(4759, 'Sisters', 'Arthur B. Davies\nAmerican, 1862-1928', 'https://www.artic.edu/iiif/2/6f7e7339-fe2f-e442-96c4-47b1dd10ecef/full/843,/0/default.jpg', 1919, 'United States', 'A work made of soft ground etching and aquatint on cream laid paper.', 'Prints and Drawings'),
(4853, 'Tartessians', 'Arthur B. Davies\nAmerican, 1862-1928', 'https://www.artic.edu/iiif/2/5d87b571-a409-582d-332c-9a66bcd52f52/full/843,/0/default.jpg', 1920, 'United States', 'A work made of soft ground etching, with aquatint, on ivory wove paper.', 'Prints and Drawings'),
(5059, 'Painter Working Outdoors', 'Lloyd R. Jones\nAmerican, 1890-1934', 'https://www.artic.edu/iiif/2/9eaaa1b1-1d2b-9638-a22e-f93e03091017/full/843,/0/default.jpg', 1930, 'United States', 'A work made of watercolor, over graphite, on ivory watercolor paper.', 'Prints and Drawings'),
(5357, 'The Red Armchair', 'Pablo Picasso\nSpanish, active France, 1881–1973', 'https://www.artic.edu/iiif/2/c617e2f0-d5fe-0772-390e-6d8c83895815/full/843,/0/default.jpg', 1931, 'Spain', 'Cubist painting of woman, bright yellow, green, purple colors.', 'Modern Art'),
(5570, 'Bacchantes', 'Arthur B. Davies\nAmerican, 1862-1928', 'https://www.artic.edu/iiif/2/cb372a5e-f8c1-6ff0-39e0-7f966c8ffa62/full/843,/0/default.jpg', 1920, 'United States', 'A work made of transfer lithograph, with lithotint, on cream wove paper.', 'Prints and Drawings'),
(5585, 'Coin Portraying Q. Pompeius Rufus', 'Roman', 'https://www.artic.edu/iiif/2/8bc5078b-b9f4-26fb-887c-9bb2121e9e05/full/843,/0/default.jpg', -54, 'Roman Empire', 'A work made of silver.', 'Arts of the Ancient Mediterranean and Byzantium'),
(5694, 'Wall Hanging', 'Emily K. Wilson (American, active c. 1901–2000)\nUnited States, Indiana, Bloomington', 'https://www.artic.edu/iiif/2/3ebefe9b-3566-4c27-9de8-b51af0c2acd2/full/843,/0/default.jpg', 1957, 'Indiana', 'A work made of handwoven wool, double weave.', 'Textiles'),
(7239, 'Standing Female Nude, Left Leg Raised', 'Arthur B. Davies\nAmerican, 1862-1928', 'https://www.artic.edu/iiif/2/514faab8-96da-9e2b-f213-abef8db2886e/full/843,/0/default.jpg', 1922, 'United States', 'A work made of white chalk, with traces of graphite, on brown laid paper (partially discolored to tan).', 'Prints and Drawings'),
(7260, 'Standing Female Nude', 'Arthur B. Davies\nAmerican, 1862-1928', 'https://www.artic.edu/iiif/2/2c730218-a7f0-df7b-2960-b0f238c8f484/full/843,/0/default.jpg', 1893, 'United States', 'A work made of black crayon and white chalk on brown laid paper (partially discolored to tan).', 'Prints and Drawings'),
(11326, 'Still Life', 'Glenn O. Coleman\nAmerican, 1887-1932', 'https://www.artic.edu/iiif/2/c1e3e25e-1d78-69ef-280f-dae56df44fef/full/843,/0/default.jpg', 1931, 'United States', 'A work made of lithograph on buff wove paper.', 'Prints and Drawings'),
(11371, 'Spring Rains', 'William Victor Higgins\nAmerican, 1884–1949', 'https://www.artic.edu/iiif/2/f3ad0bd5-2502-a308-bd69-e6ca4987f55f/full/843,/0/default.jpg', 1924, 'United States', 'A work made of oil on canvas.', 'Arts of the Americas'),
(11925, 'Japanese Pine', 'Bertha E. Jaques\nAmerican, 1863-1941', 'https://www.artic.edu/iiif/2/f318552f-b97a-cd0d-4ad4-0881eb7ec896/full/843,/0/default.jpg', 1924, 'United States', 'A work made of color etching on white laid japanese paper.', 'Prints and Drawings'),
(13935, 'Ascot By Motor Bus', 'F. Gregory Brown (English, 1887-1948)\nprinted by Waterlow and Sons Limited Lithographers\npublished by Underground Electric Railways Company of London Limited', 'https://www.artic.edu/iiif/2/29ab6108-3423-3eae-49f1-540da343368d/full/843,/0/default.jpg', 1922, 'England', 'A work made of color lithograph on cream wove paper.', 'Prints and Drawings'),
(14365, 'Medal Commemorating James McNeill Whistler', 'V. D. Brenner, Sr.\nAmerican, born Russia, 1871–1929', 'https://www.artic.edu/iiif/2/a03ffd3b-e779-189f-6121-51484df85fc5/full/843,/0/default.jpg', 1929, 'New York City', 'A work made of bronze.', 'Arts of the Americas'),
(14582, 'Female Nude Seen from Back', 'Ralph M. Hattersley\nAmerican, 1921–2000', 'https://www.artic.edu/iiif/2/2ee4bc71-d3ad-32fe-0d02-4bfea1e2de61/full/843,/0/default.jpg', 1960, 'United States', 'A work made of gelatin silver print.', 'Photography and Media'),
(14698, 'Decorated Initial \"G\" in Pink with Curling Leaves from a Manuscript', 'European', 'https://www.artic.edu/iiif/2/86296102-d04c-8413-34e0-36d96668c0dd/full/843,/0/default.jpg', 1400, 'Europe', 'Cutting from a manuscript of the letter G in pink on a green-brown background, with curling leafs in red, blue, and green.', 'Prints and Drawings'),
(14765, 'Waiting to Go On Stage', 'Laura Johnson Knight\nEnglish, 1877-1970', 'https://www.artic.edu/iiif/2/d9da26df-6d8d-2965-7eb6-f7e3f410c183/full/843,/0/default.jpg', 1933, 'England', 'Painting of a woman in a dressing room reclining on an upholstered chair, her legs raised on a wooden chair, surrounded by costumes.', 'Prints and Drawings'),
(15566, 'The Mysteriously Abandoned New Home', 'H. C. Westermann\nAmerican, 1922-1981', 'https://www.artic.edu/iiif/2/eec29c98-290a-0cf4-3339-43a82646d095/full/843,/0/default.jpg', 1958, 'United States', 'A work made of pine, birch, vermillion, redwood, glass, paint, and wheels.', 'Contemporary Art'),
(16327, 'The Annunciation', 'Jean Hey, known as The Master of Moulins\nFrench, active c. 1475- c. 1505', 'https://www.artic.edu/iiif/2/77951d0c-d781-eac6-f4ff-f13cc5cfc0cf/full/843,/0/default.jpg', 1495, 'France', 'Painting of the Annunciation, dove flying above Mary with angel.', 'Painting and Sculpture of Europe'),
(16568, 'Water Lilies', 'Claude Monet\nFrench, 1840-1926', 'https://www.artic.edu/iiif/2/3c27b499-af56-f0d5-93b5-a7f2f1ad5813/full/843,/0/default.jpg', 1906, 'France', 'Painting of a pond seen up close spotted with thickly painted pink and white water lilies and a shadow across the top third of the picture.', 'Painting and Sculpture of Europe'),
(18826, 'John D. Rockefeller', 'Alexander Calder\nAmerican, 1898–1976', 'https://www.artic.edu/iiif/2/3fe70229-33a1-6e23-cb46-72ee8b156596/full/843,/0/default.jpg', 1930, 'United States', 'A work made of wire and dime.', 'Contemporary Art'),
(19085, 'The Actor Shinomiya Heihachi I', 'Attributed to Torii Kiyonobu I\nJapanese, 1664-1729', 'https://www.artic.edu/iiif/2/f74fa036-6165-0af3-4557-2ae6545722bb/full/843,/0/default.jpg', 1708, 'Japan', 'A work made of hand-colored woodblock print; hosoban, tan-e.', 'Arts of Asia'),
(19829, 'Wall', 'Robert W. Mallary (American, 1917-1997)\nprinted by Emil Weddige\npublished by Tamarind Lithography Workshop (American, founded 1960)', 'https://www.artic.edu/iiif/2/3aa71a30-f9b6-e4a0-d566-258ff685f880/full/843,/0/default.jpg', 1962, 'United States', 'A work made of color lithograph on ivory wove paper.', 'Prints and Drawings'),
(20706, 'Semele or Fireflies', 'Arthur B. Davies\nAmerican, 1862–1928', 'https://www.artic.edu/iiif/2/e474f7cf-2e39-1de2-3fd3-ccb6b84c78f2/full/843,/0/default.jpg', 1907, 'United States', 'A work made of oil on canvas.', 'Arts of the Americas'),
(21023, 'Buddha Shakyamuni Seated in Meditation (Dhyanamudra)', 'India\nTamil Nadu, Nagapattinam', 'https://www.artic.edu/iiif/2/0675f9a9-1a7b-c90a-3bb6-7f7be2afb678/full/843,/0/default.jpg', 1200, 'Nagapattinam', 'Dark stone sculpture of Buddha sitting cross-legged, hands in lap, eyes closed.', 'Arts of Asia'),
(22938, 'Drawing Lots for Prizes (Ho biki)', 'Kitagawa Utamaro 喜多川 歌麿\nJapanese, 1753 (?)-1806', 'https://www.artic.edu/iiif/2/8ea8bc1f-f741-b668-90e3-27f299b36f85/full/843,/0/default.jpg', 1803, 'Japan', 'A work made of color woodblock prints; oban triptych.', 'Arts of Asia'),
(23972, 'title', 'artist', 'img', 1282, 'ciao', 'ciao', 'ciao'),
(24361, 'The Holy Trinity with Saint Michael Conquering the Dragon', 'Pietro da Cortona\nItalian, 1596-1669', 'https://www.artic.edu/iiif/2/484f8cd4-97a3-9ca2-af2c-2b4c7daa51a0/full/843,/0/default.jpg', 1669, 'Italy', 'A work made of pen and brown ink, with brush and brown and gray wash, heightened with lead white (discolored) and black chalk, on tan laid paper, laid down on tan laid card.', 'Prints and Drawings'),
(27992, 'A Sunday on La Grande Jatte — 1884', 'Georges Seurat\nFrench, 1859-1891', 'https://www.artic.edu/iiif/2/1adf2696-8489-499b-cad2-821d7fde4b33/full/843,/0/default.jpg', 1886, 'France', 'Large painting of people in a crowded park, brushstrokes are dots.', 'Painting and Sculpture of Europe'),
(28560, 'The Bedroom', 'Vincent van Gogh\nDutch, 1853-1890', 'https://www.artic.edu/iiif/2/25c31d8d-21a4-9ea1-1d73-6a2eca4dda7e/full/843,/0/default.jpg', 1889, 'Netherlands', 'Painting of bedroom, blue walls, green window, tan bed, red bedding.', 'Painting and Sculpture of Europe'),
(31114, 'Subscribe in Order to Hasten Peace through Victory.', 'Albert Besnard (French, 1849-1934)\nPublished by Maquet Gr.', 'https://www.artic.edu/iiif/2/bf4eda97-f0a0-6450-7e56-01fa57f424da/full/843,/0/default.jpg', 1917, 'France', 'A work made of color lithograph on cream wove paper.', 'Prints and Drawings'),
(32064, 'Sherman and His Generals', 'George N. Barnard\nAmerican, 1819–1902', 'https://www.artic.edu/iiif/2/4dd1def2-060c-d539-0d84-8c448c64d8fc/full/843,/0/default.jpg', 1865, 'United States', 'A work made of albumen print, plate 1 from the album \"photographic views of the sherman campaign\" (1866).', 'Photography and Media'),
(38626, 'Lascaux', 'Barbara S. Spitz\nAmerican, born 1926', 'https://www.artic.edu/iiif/2/e281b761-9a00-5d6c-5f5e-be88b428f78d/full/843,/0/default.jpg', 1971, 'United States', 'A work made of color etching, photo-transfer, aquatint, and electric engraving on white wove paper.', 'Prints and Drawings'),
(39229, 'D-Yard Attica', 'Roger Brown\nAmerican, 1941–1997', 'https://www.artic.edu/iiif/2/8991bc76-a1f2-f5bd-f033-98fb0039f603/full/843,/0/default.jpg', 1971, 'United States', 'A work made of oil on canvas.', 'Contemporary Art'),
(40072, 'Scene from Voltaire\'s \"La Pucelle d\'Orléans\"', 'H. Guérin\nFrench, 19th century', 'https://www.artic.edu/iiif/2/5bc299b7-0042-8a3a-5c16-cfb34b827174/full/843,/0/default.jpg', 1820, 'France', 'A work made of lithograph in black on cream wove paper.', 'Prints and Drawings'),
(45363, 'A18: Shaker Living Room, c. 1800', 'Designed by Narcissa Niblack Thorne\nAmerican, 1882-1966', 'https://www.artic.edu/iiif/2/3e42700c-92e2-aef4-89f5-021d7c40eb4f/full/843,/0/default.jpg', 0, 'United States', 'Miniature room featuring wide-plank hardwood floors, round hooked rugs, simple wooden furnishings, and a wood-burning stove. The window frames and door frames are painted green, while the walls are a light butter yellow.', 'Applied Arts of Europe'),
(50283, 'Inland Sea, Japan', 'David Hockney\nEnglish, born 1937', 'https://www.artic.edu/iiif/2/88b698dc-a1bb-2a92-597f-83a1402da5e1/full/843,/0/default.jpg', 1971, 'England', 'A work made of black and colored crayons on white wove paper.', 'Prints and Drawings'),
(52660, 'The River', 'O. Louis Guglielmi\nAmerican, born Egypt, 1906–1956', 'https://www.artic.edu/iiif/2/6503a528-7691-65bf-d1b9-0af69edb17a1/full/843,/0/default.jpg', 1942, 'United States', 'A work made of oil on canvas.', 'Arts of the Americas'),
(54937, 'Madonna and Child (recto), and Fragment of Woman\'s Torso (verso)', 'Imitator of Leonardo da Vinci\nItalian, 1452-1519', 'https://www.artic.edu/iiif/2/4e08658d-0905-b078-93be-46f4165eb2d6/full/843,/0/default.jpg', 1825, 'Italy', 'A work made of brush and brown wash over graphite, on cream laid paper, laid down on tan laid card (recto/verso).', 'Prints and Drawings'),
(61146, 'J. Ellis Bonham', 'William Bonnell\nAmerican, 1804–1865', 'https://www.artic.edu/iiif/2/77da3827-005a-2149-c590-34d31fdfa83c/full/843,/0/default.jpg', 1825, 'United States', 'A work made of oil on panel.', 'Arts of the Americas'),
(68934, 'Pilaster Capital from the Marshall Field Wholesale Store, Chicago, Illinois', 'H. H. Richardson\nAmerican, 1838-1886', 'https://www.artic.edu/iiif/2/bb62043d-e853-cb1c-33aa-cd8792eed901/full/843,/0/default.jpg', 1887, 'Chicago', 'A work made of red granite.', 'Architecture and Design'),
(69875, 'Bergman Model 1896 Semi-Automatic Pistol', 'Decorator: Raymond J. Wielgus\nAmerican, 1910-2010', 'https://www.artic.edu/iiif/2/989e72e8-7646-1981-eba9-a07bbc2c9f47/full/843,/0/default.jpg', 1905, 'Tucson', 'A work made of stainless steel, gold, and ivory.', 'Applied Arts of Europe'),
(80607, 'Self-Portrait', 'Vincent van Gogh\nDutch, 1853-1890', 'https://www.artic.edu/iiif/2/26d3cea8-44c0-bfbd-a91a-19a007517152/full/843,/0/default.jpg', 1887, 'Netherlands', 'Painting of a red-haired, bearded man with light skin, painted in short brushstrokes and multicolored dots. The background is likewise a mass of small, closely spaced colored dots, these in green, blue, and red-orange.', 'Painting and Sculpture of Europe'),
(84092, 'Roma Antica', 'After Giovanni Paolo Pannini\nItalian, 1691-1765', 'https://www.artic.edu/iiif/2/99c8eeea-f07a-af30-c79e-1da4d55243a3/full/843,/0/default.jpg', 1760, 'Italy', 'A work made of pen and black ink, watercolor, and brush and gray wash, heightened with touches of white gouache, over graphite, on ivory laid paper, laid down on cream laid card.', 'Prints and Drawings'),
(84600, 'Sketches of Horses\' (or Dromedaries\') Legs (recto); Columns (verso)', 'Follower of Leonardo da Vinci\nItalian, 1452-1519', 'https://www.artic.edu/iiif/2/842508b2-5cd8-b0b6-90f3-43b9fad5da64/full/843,/0/default.jpg', 1532, 'Italy', 'A work made of pen and brown ink (recto), and black chalk (verso) on tan laid paper.', 'Prints and Drawings'),
(90903, 'Two Sisters, Valencia', 'Joaquín Sorolla y Bastida\nSpanish, 1863-1923', 'https://www.artic.edu/iiif/2/79b12530-6b59-0992-322d-149cf05d4ee5/full/843,/0/default.jpg', 1909, 'Spain', 'A work made of oil on canvas.', 'Painting and Sculpture of Europe'),
(92214, 'Brooklyn Bridge', 'Sherril V. Schell\nAmerican, 1877–1964', 'https://www.artic.edu/iiif/2/5bf1a5a2-f9d2-8453-c7cf-a1882ec8c86b/full/843,/0/default.jpg', 1940, 'United States', 'A work made of gelatin silver print.', 'Photography and Media'),
(94163, 'Hercules and Lychas', 'French (Paris)\nAfter a lost model by Antonio Canova\nItalian, 1757-1822', 'https://www.artic.edu/iiif/2/643aa10a-f69c-5d4d-01e7-626f022c0874/full/843,/0/default.jpg', 1900, 'Italy', 'A work made of bronze.', 'Painting and Sculpture of Europe'),
(106450, 'Double-Barrel Revolving Flintlock Holster Pistol (One of a Pair)', 'Gunsmith: T. (Thomas) Thiermay (Flemish, active about 1720-50)\nBarrelsmith: Daniel Thiermay (Flemish, active about 1700-40)\nLiège', 'https://www.artic.edu/iiif/2/3a95d5a2-0f6a-b32c-31f1-76d9ad793ba4/full/843,/0/default.jpg', 1730, 'Liège', 'A work made of steel, brass, gilding, and walnut.', 'Applied Arts of Europe'),
(111424, 'McCormick Place: Perspective View Looking toward Lake', 'Gene Summers, designer and delineator, for C.F. Murphy Associates\nAmerican, 1928–2011\nAssisted by Helmut Jahn (design) and Tom Burke (delineating)', 'https://www.artic.edu/iiif/2/f6e902e4-227f-53f4-da7e-3eb9f5d9776e/full/843,/0/default.jpg', 1969, 'Chicago', 'A work made of collage with photographic print and line drawing.', 'Architecture and Design'),
(111740, 'Salomé', 'Hans von Aachen\nGerman, c. 1552-1615', 'https://www.artic.edu/iiif/2/6f6ca126-fc9e-a0f2-ae66-51ab9478cf10/full/843,/0/default.jpg', 1610, 'Germany', 'A work made of black chalk and brush and gray wash, heightened with touches of white gouache, over traces of charcoal, on cream laid paper.', 'Prints and Drawings'),
(118551, 'Armor for Field and Tournament', 'Jörg T. Sorg, the Younger, after\nGerman, Augsburg, active 1502-1542', 'https://www.artic.edu/iiif/2/ff8959bc-76f1-3eae-7de6-b6bd994a5860/full/843,/0/default.jpg', 1570, 'Augsburg', 'A work made of steel with gilding, iron, brass, leather, and cord.', 'Applied Arts of Europe'),
(119982, 'Homage to Leger with K. K. [Katharine Kuh]', 'Will Barnet\nAmerican, 1911-2012', 'https://www.artic.edu/iiif/2/a0649606-38df-3931-993d-adda35cd92bf/full/843,/0/default.jpg', 1982, 'United States', 'A work made of oil on canvas.', 'Contemporary Art'),
(120014, 'Curved walls in the Julien Levy Gallery at 15 East 57th St.', 'F. M. Demarest\nAmerican, active mid-20th century', 'https://www.artic.edu/iiif/2/cd76a819-282b-2418-45ed-eb610239ec99/full/843,/0/default.jpg', 1942, 'United States', 'A work made of gelatin silver print.', 'Photography and Media'),
(120348, 'Wav(er)ing Flag', 'Vito Acconci (American, 1940-2017)\nprinted by Barbara Spies\npublished by Landfall Press (American, founded 1970)', 'https://www.artic.edu/iiif/2/8eff7564-0651-8c94-e717-872d5c5e63fb/full/843,/0/default.jpg', 1990, 'United States', 'A work made of lithograph in blue and red on white wove paper.', 'Prints and Drawings'),
(120500, '\"Sitting Beaver\" Chair from \"Experimental Edges\" Series', 'Frank O. Gehry\nAmerican, born Canada 1929', 'https://www.artic.edu/iiif/2/acd0d4cd-e798-a94f-52af-d0c630a6a711/full/843,/0/default.jpg', 1982, 'Santa Monica', 'A work made of corrugated cardboard and plywood.', 'Architecture and Design'),
(121237, 'A Mother and Son at a Resort, Kauai, Hawaii', 'Joel Sternfeld\nAmerican, born 1944', 'https://www.artic.edu/iiif/2/30fe4765-a18f-e6c5-65b4-3472daf11ea3/full/843,/0/default.jpg', 1988, 'United States', 'A work made of chromogenic print, from the series \"stranger passing\".', 'Photography and Media'),
(122232, 'Laurette with a Cup of Coffee', 'Henri Matisse\nFrench, 1869–1954', 'https://www.artic.edu/iiif/2/72d28816-c42f-af88-63fc-d12426db240e/full/843,/0/default.jpg', 1916, 'France', 'A work made of oil on canvas.', 'Modern Art'),
(129250, '\"Coming Out\" for Harrison', 'Samuel D. Ehrhart\nAmerican, c. 1862-1937', 'https://www.artic.edu/iiif/2/8dc2a435-9296-8214-9d6e-df2e9a165cce/full/843,/0/default.jpg', 1900, 'United States', 'A work made of color lithograph on newsprint.', 'Prints and Drawings'),
(134573, 'Amulet of Re-Horakhty', 'Egyptian', 'https://www.artic.edu/iiif/2/1a71be66-90d3-5516-7480-dcc05f3891ab/full/843,/0/default.jpg', -1, 'Egypt', 'A work made of faience.', 'Arts of Africa'),
(137125, 'Many Mansions', 'Kerry James Marshall\nAmerican, born 1955', 'https://www.artic.edu/iiif/2/d94d0e3d-5d89-ce07-ee0f-7fa6d8def8ab/full/843,/0/default.jpg', 1994, 'United States', 'Painting of three black youths gardening, residential towers loom in the background.', 'Contemporary Art'),
(140689, 'Jitterbugs II', 'William H. Johnson\nAmerican, 1901-1970', 'https://www.artic.edu/iiif/2/dfa04dd2-4616-108f-8d6b-29a593272eb1/full/843,/0/default.jpg', 1946, 'United States', 'A colorful screenprint that depicts abstracted figures dancing. A brown-skinned man wearing a black suit and orange shoes energetically dances with a brown-skinned woman wearing a yellow dress and blue shoes. To the right of the woman are orange shapes th', 'Prints and Drawings'),
(143683, 'Handkerchief', 'Manufactured by A. & C. Cramer (German, active about 1876)\nGermany, Düsseldorf', 'https://www.artic.edu/iiif/2/507af6a9-3343-ee40-ad65-f22200251005/full/843,/0/default.jpg', 1880, 'Düsseldorf', 'A work made of cotton, plain weave; roller and engraved roller printed.', 'Textiles'),
(145558, 'Ruins in Charleston, S.C.', 'George N. Barnard\nAmerican, 1819–1902', 'https://www.artic.edu/iiif/2/f15c69d1-8576-f3db-e148-31e82ae13ac0/full/843,/0/default.jpg', 1866, 'United States', 'A work made of albumen print, plate 60 from the album \"photographic views of the sherman campaign\" (1866).', 'Photography and Media'),
(145681, 'Frederick Douglass', 'Samuel J. Miller\nAmerican, 1822–1888', 'https://www.artic.edu/iiif/2/a146920f-65dd-66d0-68ec-f6fff2451e5e/full/843,/0/default.jpg', 1852, 'United States', 'Historical black and white photographical portrait of Black man in a suit, gold frame.', 'Photography and Media'),
(159596, 'The Wedding Present', 'Vladimir Lebedev\nBorn St. Petersburg, 1891; died Leningrad, 1967\nSamuil Iakovlevich Marshak\nBorn Voronezh, 1887; died Moscow, 1964', 'https://www.artic.edu/iiif/2/9abaa244-0a10-2f36-a13b-cef0d8256a5d/full/843,/0/default.jpg', 1942, 'Russia', 'A work made of stencil.', 'Prints and Drawings'),
(159599, 'Spiders in a Jar', 'Vladimir Lebedev\nBorn St. Petersburg, 1891; died Leningrad, 1967\nSamuil Iakovlevich Marshak\nBorn Voronezh, 1887; died Moscow, 1964', 'https://www.artic.edu/iiif/2/7f690427-e9ed-d1d2-e682-cb89e90e04b6/full/843,/0/default.jpg', 1942, 'Russia', 'A work made of stencil.', 'Prints and Drawings'),
(160101, '\"Housetop Half-Log Cabin\" Quilt', 'Jessie T. Pettway\nAmerican, born 1929\nUnited States, Alabama, Gee\'s Bend', 'https://www.artic.edu/iiif/2/d0190956-efe7-3db2-cde7-209e9d76446a/full/843,/0/default.jpg', 1985, 'Alabama', 'A work made of pieced cotton, polyester, cellulose acetate, silk, rayon and acrylic, plain weaves; some with supplementary warps some forming cut voided pile; some self-patterned by main warp and ground weft floats; some printed; plain weave derived float', 'Textiles'),
(181000, 'Mobile Penicillin Laboratory, Model', 'Bertrand Goldberg\nAmerican, 1913-1997', 'https://www.artic.edu/iiif/2/1f0915fd-aca4-4b25-0e19-c44fba61a2f2/full/843,/0/default.jpg', 1943, 'United States', 'A work made of mixed media model.', 'Architecture and Design'),
(182244, 'Volcano', 'Ay-o\nJapanese, born 1931', 'https://www.artic.edu/iiif/2/f5dd38c6-d8a6-59d0-c6b5-6436a2316690/full/843,/0/default.jpg', 1974, 'Japan', 'A work made of silkscreen; edition 31/175.', 'Arts of Asia'),
(188540, 'Sur, Long Island City, New York', 'Hernan Diaz Alonso \nAmerican, born Argentina, 1969\nXefirotarch \nAmerican, founded 2001', 'https://www.artic.edu/iiif/2/b4e0002f-8e04-7517-78a5-87329f6e5142/full/843,/0/default.jpg', 2005, '', 'Scale contemporary architectural model of pavilion, looks like distorted skeleton.', 'Architecture and Design'),
(190578, 'Q', 'Neil Winokur\nAmerican, born 1945', 'https://www.artic.edu/iiif/2/efd0ccd7-77af-2eb6-1f46-061e3e0d869f/full/843,/0/default.jpg', 2007, 'United States', 'A work made of silver dye-bleach print, from the portfolio \"a-z\" (2007); edition 3 of 10.', 'Photography and Media'),
(191452, 'Flooded Marina (Gas Pumps), Salton Sea, California', 'Richard Misrach\nAmerican, born 1949', 'https://www.artic.edu/iiif/2/6f70ccce-baa7-ed19-4c36-e9645046242a/full/843,/0/default.jpg', 1983, 'United States', 'A work made of chromogenic print from digital file, from the series \"desert cantos iii: the flood,\" edition 23/25.', 'Photography and Media'),
(192411, 'A Belorussian Landscape', 'Vladimir Lebedev\n(Born St. Petersburg, 1891; died Leningrad, 1967)\nDem\'ian Bednyi\n(Born Gubovka, 1883; died Moscow, 1945)', 'https://www.artic.edu/iiif/2/58e8e383-b887-57b9-b403-9421b8500dc0/full/843,/0/default.jpg', 1944, 'Soviet Union', 'A work made of stencil.', 'Prints and Drawings'),
(192708, 'The Old Fence', 'Thomas Faed\nScottish, 1826-1900', 'https://www.artic.edu/iiif/2/4f9eeba8-88f4-e25b-4e09-857eb58cf138/full/843,/0/default.jpg', 1900, 'Scotland', 'A work made of watercolor, over graphite on ivory wove paper.', 'Prints and Drawings'),
(193267, 'Untitled Sketches for Furniture', 'Frank O. Gehry\nAmerican, born Canada, 1929', 'https://www.artic.edu/iiif/2/7a2c365f-df16-dcce-de4c-8536a39305db/full/843,/0/default.jpg', 1998, 'United States', 'A work made of ink on poster board.', 'Architecture and Design'),
(193869, 'Calla Lilies', 'Arthur B. Carles\nAmerican, 1882–1952', 'https://www.artic.edu/iiif/2/a8e8b0d2-9e40-0d5d-7747-93f12d5811fe/full/843,/0/default.jpg', 1925, 'United States', 'A work made of oil on canvas.', 'Arts of the Americas'),
(196075, 'AF 25', 'Al Held\nAmerican, 1928-2005', 'https://www.artic.edu/iiif/2/990353e6-c3b4-035f-c5b8-1a4a20ef9cd2/full/843,/0/default.jpg', 1959, 'United States', 'A work made of brush and black ink on ivory wove paper.', 'Prints and Drawings'),
(199176, 'Postcard Commemorating the Russian All-Union Spartakiada', 'Gustav Klutsis\nLatvian, 1895-1938', 'https://www.artic.edu/iiif/2/7b82f6f9-abab-92aa-269a-47b5d8cb3fe3/full/843,/0/default.jpg', 1928, 'Latvia', 'A work made of color lithograph on off-white wove card.', 'Prints and Drawings'),
(201864, 'Oyster Plate', 'Designed by Theodore Russell Davis \nAmerican, 1840–1894\nMade by Haviland & Co. \nLimoges, France, founded 1842', 'https://www.artic.edu/iiif/2/358c6200-3f2a-2a3e-920e-f770812907a9/full/843,/0/default.jpg', 1887, 'Limoges', 'A work made of porcelain, enamel, and gilding.', 'Arts of the Americas'),
(209587, 'Owls', 'N. McWhinnie\nAmerican, 20th century', 'https://www.artic.edu/iiif/2/d4c6a164-4ffc-6396-3a7b-fe8e2d3d1985/full/843,/0/default.jpg', 1953, 'United States', 'A work made of wood engraving in black on ivory japanese paper, tipped onto gold and folded white card.', 'Prints and Drawings'),
(212476, 'Health Sciences Center, Stony Brook, New York, Perspective', 'Bertrand Goldberg & Associates (American, circa 1952–1997)\nZbigniew Z. Ciancara (American, 20th Cent.)', 'https://www.artic.edu/iiif/2/020d9c7e-b84c-8829-56c1-ec10bd02e392/full/843,/0/default.jpg', 1976, 'Stony Brook', 'A work made of marker on paper.', 'Architecture and Design'),
(229361, 'Four Mona Lisas', 'Andy Warhol\nAmerican, 1928-1987', 'https://www.artic.edu/iiif/2/867641a6-6b70-ae7d-f3f8-e8210e56694e/full/843,/0/default.jpg', 1978, 'United States', 'A work made of acrylic and silkscreen ink on linen.', 'Contemporary Art'),
(239206, 'X-X-X-X-X-X-X-X-X-X', 'Project Projects (American, founded 2004)\nAdam Michaels (American, born 1978)\nwith Glen Cummings (American, born 1965)', 'https://www.artic.edu/iiif/2/f6417dd2-a9b6-f0a4-1e3c-93b68875dca5/full/843,/0/default.jpg', 2010, 'United States', 'A work made of book.', 'Architecture and Design'),
(244623, 'La mariée mise à nu par ses célibataires même', 'Marcel Duchamp\nAmerican (b. France), 1887-1968', 'https://www.artic.edu/iiif/2/8e664ddc-5e8e-e8f0-0768-f62acb0e28fe/full/843,/0/default.jpg', 1934, '', 'A work made of cardboard box with punched holes forming the title, a green flocked interior, and copper strips forming an m on the front cover and a d on the back cover containing 93 facsimiles of manuscript notes, drawings, and photographs, one additiona', 'Ryerson and Burnham Libraries Special Collections');

-- --------------------------------------------------------

--
-- Table structure for table `cookies`
--

CREATE TABLE `cookies` (
  `id` int(11) NOT NULL,
  `hash` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `expires` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `directors`
--

CREATE TABLE `directors` (
  `id` int(11) NOT NULL,
  `cf` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `qualification` varchar(255) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `directors`
--

INSERT INTO `directors` (`id`, `cf`, `name`, `surname`, `qualification`, `img`) VALUES
(1, 'BNNFNC08T48L219O', 'Francesca', 'Bonanno', 'California Institute of Technology', 'storage/propic/m9IM2a6GSjIpJUwJSF1sK0biLpY97JPhe9maH4IP.jpg'),
(3, 'BRGBNT08L71L219A', 'Brunetta', 'Borghi', 'University of Pennsylvania', 'storage/propic/LIDNqC89lILEgK2S2kL3M47EY4etEgYm2UqjCTIe.jpg'),
(4, 'BVLFDN08E10A662S', 'Frediano', 'Bevilacqua', 'Massachusetts Institute of Technology', 'storage/propic/gJjKYSYaMUAvQt2EE7CcGGzvNjHvt0Ojy60S5b4f.jpg'),
(5, 'CRLLRC05C04D969O', 'Alberico', 'Carli', 'Harvey Mudd College', 'storage/propic/swCLGH4hThM9v5ncoc0TgS5kzOksJNO7MPIKRc7F.jpg'),
(6, 'DNILLN04T55H501U', 'Liliana', 'Diana', 'Colorado College', 'storage/propic/e3qUgKsWpnaqEjuDlKSLQpz8DAMc1JiDhZJflLwX.jpg'),
(7, 'GNDLDL04P03G273A', 'Landolfo', 'Gandolfi', 'Pennsylvania State University, University Park', 'storage/propic/Ju7Ua7Cmo6jJz9ndFmIExejV1KAyICnYZYoFqSEe.jpg'),
(8, 'MSSKAI05B41L219L', 'Aiko', 'Messina', 'University of California, Santa Barbara', 'storage/propic/wKfKV1eYsiCzC7ATXzlKjF4rFjOIDKx7OID9E3PB.jpg'),
(9, 'NPLGRG03P07G273E', 'Giorgio', 'Napoli', 'Amherst College', 'storage/propic/DIlQ90rjXl815ROjVuxyrh6Ngse9EtNEKTWSbMHu.jpg'),
(10, 'PCAMCR05A21F839T', 'Amilcare', 'Pace', 'Santa Clara University', 'storage/propic/gBNssmRHqXsvMHoaqz5MnwiDteXaxlmU2FmIxVY0.jpg'),
(11, 'PLAHTR06E19F839J', 'Hector', 'Paoli', 'Pomona College', 'storage/propic/ilUmbZVfFO3AEMz7gxqcgJBc9rK4FoufxTrgVhS9.jpg'),
(12, 'RCCMNO05M50D969M', 'Moana', 'Ricciardi', 'New York University', 'storage/propic/9mRHQuddL8nHUpP4Cpi5BhrqtSl61EHNL0pxXLs1.jpg'),
(13, 'RCRSBL02B44L736F', 'Isabel', 'Arcuri', 'University of Michigan, Ann Arbor', 'storage/propic/vNtadMhg1UoVtCDqBIhTiAN2We96IfK2YF7a0CzY.jpg'),
(14, 'SCRLNE04M67A944H', 'Elenia', 'Scarpa', 'Grinnell College', 'storage/propic/snX8WOL0mnfK1RW2nuIoHXdxq9RFkQSIGHBTLCHS.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `director_user`
--

CREATE TABLE `director_user` (
  `user_id` int(11) NOT NULL,
  `director_id` int(11) NOT NULL,
  `since` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `director_user`
--

INSERT INTO `director_user` (`user_id`, `director_id`, `since`) VALUES
(1, 1, '2021-06-05 16:58:42'),
(1, 4, '2021-06-05 16:59:40'),
(1, 5, '2021-06-05 16:59:43'),
(1, 6, '2021-06-06 13:45:04'),
(1, 7, '2021-06-06 13:45:06'),
(2, 10, '2021-06-05 17:05:11'),
(2, 13, '2021-06-05 17:05:16'),
(3, 1, '2021-06-12 15:35:26'),
(3, 7, '2021-06-12 15:20:53'),
(3, 12, '2021-06-12 15:20:47'),
(3, 14, '2021-06-12 15:20:50'),
(7, 3, '2021-06-06 18:03:49'),
(7, 4, '2021-06-06 18:03:53');

--
-- Triggers `director_user`
--
DELIMITER $$
CREATE TRIGGER `follow_trigger` AFTER INSERT ON `director_user` FOR EACH ROW BEGIN
UPDATE users 
SET nfollowing = nfollowing + 1
WHERE id = new.user_id;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `unfollow_trigger` AFTER DELETE ON `director_user` FOR EACH ROW BEGIN
UPDATE users 
SET nfollowing = nfollowing - 1
WHERE id = old.user_id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `guides`
--

CREATE TABLE `guides` (
  `id` int(11) NOT NULL,
  `cf` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `qualification` varchar(255) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `guides`
--

INSERT INTO `guides` (`id`, `cf`, `name`, `surname`, `qualification`, `img`) VALUES
(1, 'BRTMZU09H09L736Y', 'Muzio', 'Berti', 'University of Virginia', 'storage/propic/QJYQVJ1tnJxGu2VlLxK0GT9qPkaYlc2f1I7KbF7U.png'),
(2, 'BSCGMN07B17C351W', 'Gismondo', 'Boschi', 'Wheaton College', 'storage/propic/3LBgTFmlThKPAXX49JBSbxeQzBgHDcUdTPueyYwk.jpg'),
(3, 'BSSMDL02L60C351K', 'Maddalena', 'Basso', 'Harvey Mudd College', 'storage/propic/l4GBQYFUeJptqKhwQcfIqWq4PQ1TKy7sZLQejKdo.jpg'),
(4, 'FRNLGS03H53C351L', 'Algisa', 'Fiorentino', 'University of Southern California', 'storage/propic/yb8w6Qg1bfZVQdBaAfVaknxpSAn2iNFfZebyQIS6.jpg'),
(5, 'LVODTL09E59F205C', 'Donatella', 'Oliva', 'DePauw University', 'storage/propic/9yI92qEUED0qEHO9FCKRfdbLtqy8owuMO0TEyzFl.jpg'),
(6, 'MRACML04S13F839K', 'Carmelo', 'Mauro', 'Virginia Military Institute', 'storage/propic/aOcOFV2JRUzgpSwQxLIvWI8rh572KoDyHPgrhQR6.jpg'),
(7, 'MRCDFN09R53L736P', 'Delfina', 'Marchi', 'Washington and Lee University', 'storage/propic/tivntOPMlzgHTrjqSzlaBBz0jxlySKxnb1b9vGOk.jpg'),
(8, 'MRUVDM08P03D612E', 'Vladimiro', 'Mura', 'Johns Hopkins University', 'storage/propic/YInWm2Nff6H7RJwhSfmu9faMRVcJIYxPQ73OxNvA.jpg'),
(9, 'QRTRSI05H69D969T', 'Iris', 'Quarta', 'University of Illinois, Urbana-Champaign', 'storage/propic/kEKR0rXtTl1fIh4qqFXwP2dcrqlqGfnxerIDm4nK.jpg'),
(10, 'VLPNNC04S55F839M', 'Antonicca', 'Volpi', 'Brown University', 'storage/propic/Mh7UJrzI0MOIdRyZ2UD8EP1jDYinFug6Ybsez8pN.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `artwork_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `stars` tinyint(4) NOT NULL,
  `body` varchar(750) NOT NULL,
  `n_likes` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `artwork_id`, `user_id`, `created_at`, `updated_at`, `stars`, `body`, `n_likes`) VALUES
(8, 182244, 1, '2021-06-05 14:53:43', '2021-06-05 14:53:43', 5, 'Questa è la prima opera che recensisco sono molto emozionato', 1),
(9, 84600, 2, '2021-06-05 15:04:01', '2021-06-05 15:04:01', 3, 'Belli i cavalli con gli zoccoli', 1),
(10, 80607, 7, '2021-06-06 16:05:45', '2021-06-06 16:05:45', 3, 'Van Gogh in questo ritratto sembra davvero Van Gogh.. quindi ottimo lavoro!', 2),
(11, 16327, 1, '2021-06-06 16:08:57', '2021-06-06 16:08:57', 3, 'Magari ci fosse un angelo custode che mi protegge dai miei guai!!', 2),
(12, 5059, 3, '2021-06-12 13:21:53', '2021-06-12 13:21:53', 4, 'Questa opera è così estiva.. finita la sessione vado dritta al mare!', 1),
(13, 5357, 4, '2021-06-12 13:26:34', '2021-06-12 13:26:34', 3, 'Questa sono io appena alzata e in sessione. Buongiornissimo xD', 2);

--
-- Triggers `reviews`
--
DELIMITER $$
CREATE TRIGGER `reviews_trigger` AFTER INSERT ON `reviews` FOR EACH ROW BEGIN
UPDATE users 
SET nreviews = nreviews + 1
WHERE id = new.user_id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `review_user`
--

CREATE TABLE `review_user` (
  `review_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `review_user`
--

INSERT INTO `review_user` (`review_id`, `user_id`) VALUES
(8, 7),
(9, 7),
(10, 3),
(10, 7),
(11, 1),
(11, 3),
(12, 3),
(13, 3),
(13, 4);

--
-- Triggers `review_user`
--
DELIMITER $$
CREATE TRIGGER `likes_trigger` AFTER INSERT ON `review_user` FOR EACH ROW BEGIN
UPDATE reviews 
SET n_likes = n_likes + 1
WHERE id = new.review_id;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `unlikes_trigger` AFTER DELETE ON `review_user` FOR EACH ROW BEGIN
UPDATE reviews 
SET n_likes = n_likes - 1
WHERE id = old.review_id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `shows`
--

CREATE TABLE `shows` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `date_and_time` datetime NOT NULL,
  `duration` int(11) DEFAULT NULL,
  `tags` varchar(750) DEFAULT NULL,
  `cover` varchar(255) DEFAULT NULL,
  `director_id` int(11) DEFAULT NULL,
  `guide_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shows`
--

INSERT INTO `shows` (`id`, `title`, `date_and_time`, `duration`, `tags`, `cover`, `director_id`, `guide_id`) VALUES
(1, 'Show Your Work Little Temple', '2021-07-13 10:30:00', 90, 'Digital, architecture', 'storage/cover/DJpCajLEHKS2O3hqCjlfcDiY0zlCcQl2bIzoKSZD.jpg', 1, 1),
(2, 'A Renaissance Timeline With Major Events', '2021-07-27 09:00:00', 180, 'renaissance, renaissanceart, architecture, rinascimento', 'storage/cover/LBXmXB6zZz7R06aFvaCCG0YtFb0t9MiAOs8feKEr.jpg', 1, 2),
(3, 'From Baroque to Storm and Stress', '2021-08-12 12:00:00', 330, 'baroque, barocco, rococo, sicily Architecture', 'storage/cover/98CkgaBIJeVtOz1s8OaSHe3DHWWWblodWWd2ksJ5.jpg', 3, 4),
(6, 'The power to civilize, reform and transform society', '2021-07-21 08:20:00', 320, '#neoclassicism, architecture, neoclassical, neoclassicismo, classicism, oiloncanvas, portrait', 'storage/cover/HFRdptusyfdYlPO4c4U31FUgIbWg942y6PajQyT5.jpg', 5, 6),
(8, 'The origin of Romantic', '2021-07-05 09:50:00', 210, 'Romanticiscm, sturm und drang, sentimento, romantic painting', 'storage/cover/hNcmFCY5nu1WqmUHnCFRYpYI1XNetDE0vNHBsUEl.jpg', 6, 1),
(10, 'Gothic e Steampunk of Italy', '2022-01-27 10:30:00', 330, 'gothic, gothic art, medieval', 'storage/cover/QBOYleNEueP7xDQMUkBIDQUFFKA5odvnglNGs0gd.jpg', 5, 2),
(12, 'Walks of art: Van Gogh and the Thames', '2021-08-17 08:00:00', 295, 'painting, impressionistart, landscape painting, van gogh', 'storage/cover/W8OVTFMRHT6JsWPfzgwmZ821vFjIn3suMSkCW67Y.jpg', 4, 3),
(13, 'Pittura metafisica: oltre le cose visibili', '2021-07-20 17:57:00', 300, 'metafisica, metaphysics art, de chirico, void art', 'storage/cover/1cw3S3qXovSohaVbwJg5pRJKTnrl2lBZTh3JHr38.jpg', 3, 4);

-- --------------------------------------------------------

--
-- Table structure for table `show_user`
--

CREATE TABLE `show_user` (
  `show_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `since` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `show_user`
--

INSERT INTO `show_user` (`show_id`, `user_id`, `since`) VALUES
(2, 7, '2021-06-06 18:01:56'),
(6, 1, '2021-06-12 14:02:17'),
(13, 1, '2021-06-06 18:00:17');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(16) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `since` timestamp NOT NULL DEFAULT current_timestamp(),
  `nfollowing` int(11) DEFAULT 0,
  `nreviews` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `name`, `surname`, `avatar`, `since`, `nfollowing`, `nreviews`) VALUES
(1, 'alessioebbasta', '$2y$10$VufbMI2hmw8bbpU.P4cSW.TsfPYxK.YvxdTvhIg.kTWxHG1HAJy4W', 'marino.alessio9599@gmail.com', 'Alessio', 'Marino', 'storage/avatar/leonardo.png', '2021-05-12 11:26:19', 5, 2),
(2, 'matteopidone', '$2y$10$UYY13DWZJkGgVZgqb55ld.hrIsE1caHM5NZnxKIGjWrht6qyo0pJK', 'matteopidone@gmail.com', 'Matteo', 'Pidone', 'storage/avatar/picasso.png', '2021-05-12 13:42:29', 2, 1),
(3, 'martina.greco', '$2y$10$J75wcijXcROT1mWlwkuuKe1/YLnw2gum4UcCagGAuB/qsAZ1AEaQO', 'martina.greco@gmail.com', 'Martina', 'Greco', 'storage/avatar/picasso.png', '2021-05-12 13:56:44', 4, 1),
(4, 'fede.fido', '$2y$10$55f8bqUcBbAt6SOSlYDktu/PRa2es7kCb2IcRBPWrJqY8zhqRCL.C', 'fede.fido@gmail.com', 'Federica', 'Fidotta', 'storage/avatar/dali.png', '2021-05-12 13:58:01', 0, 1),
(5, 'rosy.sergi', '$2y$10$gu416VaETFOL1ueCF8KvyOwbYcZtEO0H6UuyuMedw1R./5EpPqU7u', 'rosy_sergi@gmail.com', 'Rosy', 'Sergi', 'storage/avatar/vangogh.png', '2021-05-12 13:59:06', 0, 0),
(6, 'gab.dag', '$2y$10$fNfJL/.gZ3YWBclR9bKSOOXW5ikuWauSIU.INw6W12bPyDc8SSgHi', 'gabriele.dagostino@gmail.com', 'Gabriele', 'D\'Agostino', 'storage/avatar/leonardo.png', '2021-05-13 20:12:13', 0, 0),
(7, '_calabrese23', '$2y$10$fO0WESjVmVGcWlX6U2nRBeEpj/Z/eLu5dlHu3PccZ0YgTWEqHDqJW', 'valentina.calabrese@gmail.com', 'Valentina', 'Calabrese', 'storage/avatar/picasso.png', '2021-05-15 21:26:24', 2, 1),
(8, 'vale_verzì', '$2y$10$VatoXMFPLWUy/rgfEvZVkuccNk9AcwNQ7YfkLCSHqtfwUinbM8xr.', 'valentinaverzi@gmail.com', 'Valentina', 'Verzì', 'storage/avatar/dali.png', '2021-05-24 13:55:30', 0, 0),
(9, 'anto.tomas', '$2y$10$L0ZrDRhXJttmLW3WXzrBIOpMI9tyM.7jmNPjU1ynGgKdTnW3op1Aq', 'anto.tomas@gmail.com', 'Antonella', 'Tomasello', 'storage/avatar/picasso.png', '2021-05-24 16:32:15', 0, 0),
(10, 'cristina.rubino', '$2y$10$WuhlfBu1iK6kKuH8yl67je7yIspG33dmHQVci5h1aVf4SvM0QBJYy', 'cristina.rubino@gmail.com', 'Cristina', 'Rubino', 'storage/avatar/leonardo.png', '2021-05-24 20:27:39', 0, 0),
(12, 'valentina.greco', '$2y$10$LGNRC8EqJ.MwozJBqu9pjOuw3vqHihqOclir/juXbUHNv2HM3Uyfi', 'valegreco@gmail.com', 'Valentina', 'Greco', 'storage/avatar/vangogh.png', '2021-06-08 02:52:11', 0, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `artworks`
--
ALTER TABLE `artworks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cookies`
--
ALTER TABLE `cookies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `directors`
--
ALTER TABLE `directors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cf` (`cf`);

--
-- Indexes for table `director_user`
--
ALTER TABLE `director_user`
  ADD PRIMARY KEY (`user_id`,`director_id`),
  ADD KEY `director_id` (`director_id`);

--
-- Indexes for table `guides`
--
ALTER TABLE `guides`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cf` (`cf`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `artwork_id` (`artwork_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `review_user`
--
ALTER TABLE `review_user`
  ADD PRIMARY KEY (`review_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `shows`
--
ALTER TABLE `shows`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title` (`title`,`date_and_time`),
  ADD KEY `director_id` (`director_id`),
  ADD KEY `guide_id` (`guide_id`);

--
-- Indexes for table `show_user`
--
ALTER TABLE `show_user`
  ADD PRIMARY KEY (`show_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cookies`
--
ALTER TABLE `cookies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `directors`
--
ALTER TABLE `directors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `guides`
--
ALTER TABLE `guides`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `shows`
--
ALTER TABLE `shows`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cookies`
--
ALTER TABLE `cookies`
  ADD CONSTRAINT `cookies_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `director_user`
--
ALTER TABLE `director_user`
  ADD CONSTRAINT `director_user_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `director_user_ibfk_2` FOREIGN KEY (`director_id`) REFERENCES `directors` (`id`);

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`artwork_id`) REFERENCES `artworks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `review_user`
--
ALTER TABLE `review_user`
  ADD CONSTRAINT `review_user_ibfk_1` FOREIGN KEY (`review_id`) REFERENCES `reviews` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `review_user_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shows`
--
ALTER TABLE `shows`
  ADD CONSTRAINT `shows_ibfk_1` FOREIGN KEY (`director_id`) REFERENCES `directors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `shows_ibfk_2` FOREIGN KEY (`guide_id`) REFERENCES `guides` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `show_user`
--
ALTER TABLE `show_user`
  ADD CONSTRAINT `show_user_ibfk_1` FOREIGN KEY (`show_id`) REFERENCES `shows` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `show_user_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
