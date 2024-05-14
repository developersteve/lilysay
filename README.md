# Demo Lilypad Module

This is a "hello world" style demo inspired by the classic Cowsay ascii art 

To run this demo you will need lilypad installed into your local development environment, check out the [docs to get started](https://lilypad.team/cli). 

```
lilypad run github.com/lilypad-tech/lilysay:0.1.0 -i Message='Hello lilypad world'
```

The ascii art image output can also be changed using any of the following, by adding the `-i Image=` input as part of the cli command. 

- `lilyfrog`
- `lilyrocket`
- `lilycorn`
- `lilyduck`
- `lilypad`

For example 

```
lilypad run github.com/lilypad-tech/lilysay:0.1.0 -i Message='Hello lilypad world' -i Image=lilyfrog
```

Visit the [lilypad documentation](https://lilypad.team/building) to find out more on how to build your own custom lilypad job modules.