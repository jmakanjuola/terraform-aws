[
  {
    "essential": true,
    "memory": 256,
    "name": "medal-app",
    "cpu": 256,
    "image": "${REPOSITORY_URL}:1",
    "workingDirectory": "/medal-app",
    "command": ["npm", "start"],
    "portMappings": [
        {
            "containerPort": 3000,
            "hostPort": 3000
        }
    ]
  }
]
