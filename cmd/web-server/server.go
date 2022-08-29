package main

import (
	"log"

	"github.com/gin-gonic/gin"
)

func main() {

	router := gin.Default()

	router.Static("/", "../../website/dist/test.bot")
	router.NoRoute(func(ctx *gin.Context) {
		ctx.File("../../website/dist/test.bot/index.html")
	})

	log.Fatal(router.Run(":3000"))

}
