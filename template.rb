
#Esta clase retorna el template de html 
class Template

    def initialize
        @template = %{
            <html>
            <head><title>Tarea</title></head>
            <style>
            .custom_table {
            font-family: Arial, Helvetica, sans-serif;
            border-collapse: collapse;
            width: 100%;
            }
            .custom_table td, table th {
            border: 1px solid DarkGrey;
            padding: 8px;
            }

            .custom_table tr:nth-child(even){background-color: Gainsboro;}

            .custom_table  tr:hover {background-color: DarkGrey;}

            .custom_table  th {
            padding-top: 12px;
            padding-bottom: 12px;
            text-align: left;
            background-color: MediumBlue;
            color: white;
            }
            </style>
            <body>
                <h1>Tarea Platanus</h1>
                <h3>Transaccion de mayor valor ultimas 24 hrs</h3>
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
  