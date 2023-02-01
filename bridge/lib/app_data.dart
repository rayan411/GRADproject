import 'package:bridge/models/paths.dart';
import 'package:flutter/material.dart';

import 'models/courses.dart';

const Paths_data = const [
  Paths(
      id: 'p1',
      name: 'Front-End devloper',
      description: "front-end developer architects and develops websites and applications using web technologies (i.e., HTML, CSS, DOM, and JavaScript), which run on the Open Web",
      sourceImage: 'images/frontend.jpg',
      link: '',
      roadmap: ''),
  Paths(
      id: 'p2',
      name: 'UX Researcher ',
      description: 'eeeeeeeeeeeeeeeeeeeee',
      sourceImage: 'images/UXResearcher.jpg',
      link: '',
      roadmap: ''),
  Paths(
      id: 'p3',
      name: 'Back-End devloper',
      description: 'sourceImage',
      sourceImage: 'images/frontend.jpg',
      link: '',
      roadmap: ''),
];
const Course_data =  [
  Course(
    id: 'c1',
    name: 'Html',
    Psths: ['p1'],
    description: 'HTML stands for HyperText Markup Language. It is used on the frontend and gives the structure to the webpage which you can style using CSS and make interactive using JavaScript.',
    links: [
      "https://www.w3schools.com/html/html_intro.asp",
      "https://www.codecademy.com/learn/learn-html",
      "https://htmlreference.io/",
    ],
  ),
  Course(
    id: 'c2',
    name: 'CSS',
    Psths: ['p1'],
    description: 'CSS or Cascading Style Sheets is the language used to style the frontend of any website. CSS is a cornerstone technology of the World Wide Web, alongside HTML and JavaScript',
    links: [
      'https://www.w3schools.com/html/html_intro.asp',
      'https://www.codecademy.com/learn/learn-html',
      'https://htmlreference.io/',
    ],
  ),

  Course(
    id: 'c3',
    name: 'JavaScript',
    Psths: ['p1'],
    description: 'JavaScript allows you to add interactivity to your pages. Common examples that you may have seen on the websites are sliders, click interactions, popups and so on.',
    links: [
      'https://www.w3schools.com/html/html_intro.asp',
      "https://www.codecademy.com/learn/learn-html",
      "https://htmlreference.io/",
    ],
  ),
];

const Users_data = [];
