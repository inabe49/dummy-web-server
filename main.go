package main

import "github.com/gin-gonic/gin"

func main() {
	r := gin.Default()
	r.GET("/*path", func(c *gin.Context) {
		p := c.Param("path")

		c.JSON(200, gin.H{
			"path": p,
		})
	})
	r.Run(":9000")
}
