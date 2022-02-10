
#Esta clase retorna el template de html 
class Template

    def initialize
        @template = %{
            <html>
            <head><title>Tarea</title></head>
            <style>
            h1 {
                font-family: Arial, Helvetica, sans-serif;
            }
            p {
                font-family: Arial, Helvetica, sans-serif;
            }
            .custom_table {
            font-family: Arial, Helvetica, sans-serif;
            border-collapse: collapse;
            width: 80%;
            border-r
            }
            .custom_table td, table th {
            border: 1px solid FloralWhite;
            padding: 8px;
            }

            .custom_table tr:nth-child(even){background-color: GhostWhite;}

            .custom_table  tr:hover {background-color: LightGreen;}

            .custom_table  th {
            padding-top: 12px;
            padding-bottom: 12px;
            text-align: left;
            background-color: ForestGreen;
            color: white;
            }
            </style>
            <body>
                <h1>Tarea Platanus</h1>
                <p>
                Transacciones de mayor valor de las ultimas 24 hrs en la plataforma de Buda
                </p>
                <table class="custom_table">
                <tr>
                    <th>Id mercado</th>
                    <th>Valor</th> 
                </tr>
                <% @markets_data.each do |market| %>
                    <tr>
                        <td><%= market[0] %></td>
                        <td><%= market[1] %></td> 
                    </tr>
                <% end %>
                </table>
            </body>
            </html>
        }.gsub(/^  /, '')
    end

    def getTemplate
        return @template
    end
end
  