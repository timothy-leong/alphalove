# Alphalove
Like Tinder, but you program your own swiper. Written in Go.

## Folder structure
The semantics are taken from https://github.com/golang-standards/project-layout.

## Architecture

```mermaid

    graph LR;
    
    B(API Server) --> D1(SQL Database)
    B --> D2(NoSQL Database)
```
- The API server exposes HTTP endpoints
- The SQL database stores user info
- The NoSQL database stores algorithms set by users
  

## Description
Trading bots (e.g. Coinrule.com) allow you to automate trading strategy execution. Users assemble their strategy as a sequence of rules (e.g. `FOR stock in portfolio, IF price INCREASES BY 5% IN 1H THEN SELL, ELSE ...`) and let their bot execute these rules automatically. 

The same automation can apply to dating where users can get bots to filter through profiles in a central data pool to provide recommendations for them. This obviates the need for swiping left. 

Furthermore, the bot can also be taught what first steps to take after "swiping right", e.g. send a pre-written introduction, or inform the user for personal follow-up. Strategies can also control the frequency and amount of "right-swipes".

The main benefit of using bots in place of traditional dating agencies would be cutting the cost of human matchmaking.

## Development goals
The first development goal is an endpoint where a user can submit a strategy in JSON. The next goal is to write a UI where users can interactively craft strategies in an HTML form, just like on a conventional algorithmic bot-trading website.

One stretch goal could be a dashboard with sample strategies for new users to explore, so that they can adapt and reuse existing strategies instead of creating one from scratch.

## Use case
Users can deploy strategies to skip the step of scrolling through multiple profiles. Alphalove returns matches that pass a user's algorithmic filter.


## Endpoints
- `Register`: For users to sign up
- `Auth`: For users to authenticate themselves
- `PutAlgo`: For registering algorithms
- `GetAlgo`: For retrieving algorithms
- `GetMatch`: Retrieve matches

## Run this project locally
- Install `helm` for drag-and-drop Kubernetes manifests for the DBMSes used in Alphalove. 
- Install `minikube` (to create a Kubernetes cluster on your local machine).
- Install `skaffold` (to deploy to the Kubernetes cluster without requiring bash scripts).
- Run `minikube start` and `skaffold dev` from the root folder.