[
  {
    "essential": true,
    "memory": 256,
    "name": "mylab-app",
    "cpu": 256,
    "image": "${REPOSITORY_URL}:1",
    "workingDirectory": "/mylab-app",
    "command": ["npm", "start"],
    "portMappings": [
        {
            "containerPort": 3000,
            "hostPort": 3000
        }
    ]
  }
]
