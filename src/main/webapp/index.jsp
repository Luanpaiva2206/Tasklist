<%-- Document : index.jsp Created on : 25/03/2021, 10:01:57 Author : User --%>

<%@page import="com.luanpaiva.tasklist.dao.TasksDAO"%>
<%@page import="com.luanpaiva.tasklist.model.Tasks"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pt-br">

    <head>
        <title>Tasklist - JavaWEB</title>
        <meta charset="utf-8"/>
        <meta http-equiv="content-type" content="text/html;charset=utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
              rel="stylesheet"
              integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
              crossorigin="anonymous">
        <link href="https://fonts.googleapis.com/css2?family=Raleway&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300&display=swap"
              rel="stylesheet">
        <link rel="stylesheet"
              href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
              integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
              crossorigin="anonymous">
        <link rel="stylesheet" href="css/style-css.css">
    </head>

    <body>
        <div id="main-container" class="container-fluid">

            <div class="container">
                <form action="TaskServlet" method="get">
                    <div class="row">
                        <div class="col-9">
                            <input id="new-task" class="form-control form-control-lg" type="text" name="task" placeholder="Nova tarefa" required/>
                        </div>
                        <div class="col-3">
                            <input id="insert-button" class="btn btn-link btn-lg" type="submit" value="CADASTRAR" onclick="insertTask()"/>
                        </div>
                    </div>
                </form>
            </div>

            <div id="list">
                <ul class="list-group list-group-flush" id="list-group">
                    <h5>CADASTRO DE TAREFAS</h5>
                    <%
                        List<Tasks> taskList = new TasksDAO().findAll();
                        for (Tasks t : taskList) {
                            String checked = null;
                            String success = null;
                            if (t.getConcluida()) {
                                checked = "checked";
                                success = "list-group-item-success";
                            }
                            out.print("\n<div class='row div-tasks'>\n"); //<div1>
                            out.print("<div class='col-8'>\n"); //<div2>
                            out.print("<li class='list-group-item list-group-item-action " + success + "' id='id-task" + t.getId() + "'><label for='checkbox" + t.getId() + "'><input type='checkbox' id='checkbox" + t.getId() + "' name='checkbox" + t.getId() + "' onclick='checkboxClick(" + t.getId() + ")' " + checked + " /> " + t.getDescricao().toUpperCase() + "</label></li>\n");
                            out.print("</div>\n"); //</div2>
                            out.print("<div class='col-3'>\n"); //<div3>
                            out.print("<div class='btn-group' role='group' aria-label='Basic example'>\n"); //<div4>
                            out.print("<a href='ActionServlet?action=concluida&idTask=" + t.getId() + "' class='btn btn-light'>Concluída</a>\n");
                            out.print("<a href='ActionServlet?action=delete&idTask=" + t.getId() + "' class='btn btn-light' onclick='deleteTask()'>Deletar</a>\n");
                            out.print("</div>\n"); //</div4>
                            out.print("</div>\n"); //</div3>
                            out.print("</div>\n"); //</div1>
                        }
                    %>
                </ul>

                <div>
                    <div id="circles-colors" class="d-flex justify-content-end">
                        <div id="circles-color0" class="change-colors" onclick="Color0()"></div>
                        <div id="circles-color1" class="change-colors" onclick="Color1()"></div>
                        <div id="circles-color2" class="change-colors" onclick="Color2()"></div>
                        <div id="circles-color3" class="change-colors" onclick="Color3()"></div>
                        <div id="circles-color4" class="change-colors" onclick="Color4()"></div>
                        <div id="circles-color5" class="change-colors" title="Random color" onclick="Color5()"></div>
                    </div>
                </div>
            </div>

            <div id="copi-bottom" class="row">
                <span id="copy-right">&COPY; 2021 Luan Paiva</span>
            </div>

        </div>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
                integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
                integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
                integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
        crossorigin="anonymous"></script>
        <script src="js/script.js"></script>
    </body>

</html>